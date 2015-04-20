require 'minesweeper/console/minefield_pretty_printer'
require 'minesweeper/console/empty_minefield_error'
require_relative '../../test_helper'
require_relative 'empty_minefield'

class MinefieldPrettyPrinterTest < Test::Unit::TestCase
  def test_initialize_expects_a_non_null_parameter
    assert_raise(StandardError) { MinefieldPrettyPrinter.new(nil) }
    assert_nothing_raised { MinefieldPrettyPrinter.new(Minesweeper::Minefield.new(4)) }
  end

  def test_print_warns_about_empty_minefield
    sut = MinefieldPrettyPrinter.new(EmptyMinefield.new())
    assert_raise(EmptyMinefieldError) { sut.print }
  end
end
