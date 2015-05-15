require 'minesweeper/console/prettyprinter/minefield_pretty_printer'
require_relative '../../../test_helper'

module Minesweeper
  module Console
    module PrettyPrinter
      class MinefieldPrettyPrinterTest < Test::Unit::TestCase
        def test_raises_error_when_initialized_with_a_nil_minefield
          assert_raise(StandardError) { MinefieldPrettyPrinter.new(nil) }
        end

        def test_output
          assert_equal(' |0|1|\n0|1|2|\n1|H|F|\n', MinefieldPrettyPrinter.new('12HF').print)
          assert_equal(' |0|1|2|3|\n0|A|A|A|A|\n1|B|B|B|B|\n2|C|C|C|C|\n3|D|D|D|D|\n', MinefieldPrettyPrinter.new('AAAABBBBCCCCDDDD').print)
        end
      end
    end
  end
end

