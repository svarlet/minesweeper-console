require 'minesweeper/console/prettyprinter/row_printer'
require_relative '../../../test_helper'
require 'minesweeper/console/prettyprinter/theme/null_theme'

module Minesweeper
  module Console
    module PrettyPrinter
      class RowPrinterTest < Test::Unit::TestCase
        SEP = '§'

        def setup
          @printer = RowPrinter.new(SEP, Theme::NullTheme.new)
        end

        def test_raise_error_when_initialized_with_a_nil_separator
          assert_raise(StandardError) { RowPrinter.new(nil, Theme::NullTheme.new) }
        end

        def test_raise_error_when_initialized_with_a_nil_theme
          assert_raise(StandardError) { RowPrinter.new('.', nil) }
        end
        def test_print_raises_error_when_column_width_is_nil
          assert_raise(StandardError) { @printer.print(0, 'XYZ', nil) }
        end

        def test_print_raises_error_when_columns_width_is_not_strictly_positive
          assert_raise(StandardError) { @printer.print(0, 'XYZ', 0) }
          assert_raise(StandardError) { @printer.print(0, 'XYZ', -1) }
        end

        def test_print_raises_error_when_desired_column_width_is_smaller_than_row_number
          assert_raise(StandardError) { @printer.print(10, 'XYZ', 1) }
        end

        def test_prints_row_number_first
          assert_match(/^0.*$/, @printer.print(0, 'HHHH', 1))
        end

        def test_prints_separator_after_row_number
          assert_match(/^\d+#{SEP}.*$/, @printer.print(0, 'HHHH', 1))
        end

        def test_prints_each_character_of_the_sequence_separated_by_separator
          assert_match(/^\d+#{SEP}X#{SEP}Y#{SEP}Z.*$/, @printer.print(0, 'XYZ', 1))
        end

        def test_print_appends_separator_at_end_of_line
          assert_match(/^.*#{SEP}$/, @printer.print(0, 'XYZ', 1))
        end

        def test_enforces_column_width_on_each_column
          result = @printer.print(0, 'XYZ', 3)
          cells = result.split(SEP)
          cells.each { |cell| assert_equal(3, cell.length) }
        end
      end
    end
  end
end

