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

  def test_print_makes_room_in_the_columns_header_for_the_rows_header
    sut = MinefieldPrettyPrinter.new(create_minefield_of_size(4))
    assert_match(/^ \|.*/, sut.print)
  end

  def test_print_includes_a_column_header
    sut = MinefieldPrettyPrinter.new(create_minefield_of_size(4))
    assert_equal(' |0|1|2|3|', sut.print)
  end

  def create_minefield_of_size(a_size)
    Minesweeper::Minefield.new(a_size)
  end
end
