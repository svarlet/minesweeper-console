require_relative '../../../../test_helper'
require 'minesweeper/console/prettyprinter/theme/default_theme'
require 'rainbow'

module Minesweeper
  module Console
    module PrettyPrinter
      module Theme
        class DefaultThemeTest < Test::Unit::TestCase
          def test_is_initializable
            DefaultTheme.new(@colorizer)
          end

          def setup
            @colorizer = Rainbow.new
            @theme = DefaultTheme.new(@colorizer)
          end

          def test_class_implementation
            class_specs = [:colorize_header, :colorize_separator, :colorize_mine_quantity, :colorize_cell_status]
            class_specs.each do |spec|
              assert_respond_to @theme, spec
              assert_raise(ArgumentError) { @theme.send(spec) }
              assert_equal('efhfh', do_with_colorizer_disabled { @theme.send(spec, 'efhfh') } )
            end
          end

          def do_with_colorizer_disabled(&block)
            @colorizer.enabled = false
            result = yield
            @colorizer.enabled = true
            result
          end
        end
      end
    end
  end
end


