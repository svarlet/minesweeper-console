require  'minesweeper/console/prettyprinter/header_printer'
require_relative '../../../test_helper'

module Minesweeper
  module Console
    module PrettyPrinter
      class HeaderPrinterTest < Test::Unit::TestCase
        SEP = '§'

        def setup
          @printer = HeaderPrinter.new(SEP)
        end

        def test_raises_error_when_initialized_with_nil_separator
          assert_raise(StandardError) { HeaderPrinter.new(nil) }
        end

        def test_raises_error_when_number_of_columns_is_zero
          assert_raise(StandardError) { @printer.print(0) }
        end

        def test_raises_error_when_number_of_columns_is_negative
          assert_raise(StandardError) { @printer.print(-1) }
        end

        def test_makes_room_for_the_greatest_row_number
          assert_match(/^ .*$/, @printer.print(1))
          assert_match(/^  .*$/, @printer.print(10))
          assert_match(/^   .*$/, @printer.print(100))
        end

        def test_inserts_separator_after_first_column
          assert_match(/^\s+#{SEP}.*$/, @printer.print(1))
        end
      end
    end
  end
end

