require_relative '../../../../test_helper'
require 'minesweeper/console/prettyprinter/theme/null_theme'

module Minesweeper
  module Console
    module PrettyPrinter
      module Theme
        class NullThemeTest < Test::Unit::TestCase
          def test_is_initializable
            NullTheme.new
          end

          def setup
            @theme = NullTheme.new
          end

          def test_class_implementation
            class_specs = [:colorize_header, :colorize_separator, :colorize_mine_quantity, :colorize_cell_status]
            class_specs.each do |spec|
              assert_respond_to @theme, spec
              assert_raise(ArgumentError) { @theme.send(spec) }
              assert_equal('efhfh', @theme.send(spec, 'efhfh'))
            end
          end
        end
      end
    end
  end
end

