require 'minesweeper/console/prettyprinter/row_printer'
require_relative '../../../test_helper'

module Minesweeper
  module Console
    module PrettyPrinter
      class RowPrinterTest < Test::Unit::TestCase
        SEP = '§'

        def setup
          @printer = RowPrinter.new(SEP)
        end

        def test_raise_error_when_initialized_with_a_nil_separator
          assert_raise(StandardError) { RowPrinter.new(nil) }
        end

        def test_prints_row_number_first
          assert_match(/^0.*$/, @printer.print(0, 'HHHH'))
        end

        def test_prints_separator_after_row_number
          assert_match(/^\d+#{SEP}.*$/, @printer.print(0, 'HHHH'))
        end

        def test_prints_each_character_of_the_sequence_separated_by_separator
          assert_match(/^\d+#{SEP}X#{SEP}Y#{SEP}Z.*$/, @printer.print(0, 'XYZ'))
        end

        def test_appends_separator
          assert_match(/^.*#{SEP}$/, @printer.print(0, 'XYZ'))
        end
      end
    end
  end
end

