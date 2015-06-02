require 'minesweeper/console/prettyprinter/minefield_pretty_printer'
require 'minesweeper/console/prettyprinter/theme/null_theme'
require_relative '../../../test_helper'

module Minesweeper
  module Console
    module PrettyPrinter
      class MinefieldPrettyPrinterTest < Test::Unit::TestCase
        def test_raises_error_when_initialized_with_a_nil_minefield
          assert_raise(ArgumentError) { MinefieldPrettyPrinter.new(nil) }
        end

        def test_output
          verify_printing_of(" |0|1|\n0|1|2|\n1|H|F|\n", '12HF')
          verify_printing_of(" |0|1|2|3|\n0|A|A|A|A|\n1|B|B|B|B|\n2|C|C|C|C|\n3|D|D|D|D|\n", 'AAAABBBBCCCCDDDD')
        end

        def verify_printing_of(expected, str_representation)
          minefield = MinefieldMock.new(str_representation)
          theme = Theme::NullTheme.new
          printer = MinefieldPrettyPrinter.new(minefield, theme)
          assert_equal(expected, printer.print)
        end
      end

      class MinefieldMock
        def initialize(string_representation)
          @string_representation = string_representation
        end

        def to_s
          @string_representation
        end

        def row_count
          Math.sqrt(@string_representation.length).to_i
        end
      end
    end
  end
end

