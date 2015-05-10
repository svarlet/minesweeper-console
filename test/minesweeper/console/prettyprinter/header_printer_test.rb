require  'minesweeper/console/prettyprinter/header_printer'
require_relative '../../../test_helper'

module Minesweeper
  module Console
    module PrettyPrinter
      class HeaderPrinterTest < Test::Unit::TestCase
        SEP = '§'

        def test_raises_error_when_initialized_with_nil_separator
          assert_raise(StandardError) { HeaderPrinter.new(nil) }
        end

        def test_raises_error_when_number_of_columns_is_zero
          printer = HeaderPrinter.new(SEP)
          assert_raise(StandardError) { printer.print(0) }
        end

        def test_raises_error_when_number_of_columns_is_negative
          printer = HeaderPrinter.new(SEP)
          assert_raise(StandardError) { printer.print(-1) }
        end
      end
    end
  end
end

