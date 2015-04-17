require 'minesweeper/console/minefield_pretty_printer'
require_relative '../../test_helper'

class MinefieldPrettyPrinterTest < Test::Unit::TestCase
  def test_initialize_expects_a_non_null_parameter
    assert_raise(StandardError) { MinefieldPrettyPrinter.new(nil) }
  end
end
