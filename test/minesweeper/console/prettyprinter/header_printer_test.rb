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
          assert_match(/^  .*$/, @printer.print(11))
          assert_match(/^   .*$/, @printer.print(101))
        end

        def test_inserts_separator_after_first_column
          assert_match(/^\s+#{SEP}.*$/, @printer.print(1))
        end

        def test_first_column_number_is_zero
          assert_match(/^\s#{SEP}0.*$/, @printer.print(1))
        end

        def test_first_column_number_is_followed_by_separator
          assert_match(/^.*#{SEP}$/, @printer.print(1))
        end

        def test_prints_all_columns_number_upto_but_not_including_the_number_of_columns
          assert_equal(" #{SEP}0#{SEP}1#{SEP}", @printer.print(2))
        end

        def test_each_column_is_printed_with_the_width_of_the_greatest_column_number
          result = @printer.print(100)
          headers = result.split(SEP)
          headers.each { |header| assert_equal(2, header.length) }
        end
      end
    end
  end
end

