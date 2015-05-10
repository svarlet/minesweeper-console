require 'minesweeper/console/minefield_pretty_printer'
require 'minesweeper/console/empty_minefield_error'
require_relative '../../test_helper'
require_relative 'empty_minefield'

class MinefieldPrettyPrinterTest < Test::Unit::TestCase
  ROW_HEADER_REGEX = /^\d+|.*/

  def test_initialize_expects_a_non_null_parameter
    assert_raise(StandardError) { MinefieldPrettyPrinter.new(nil) }
    assert_nothing_raised { MinefieldPrettyPrinter.new(Minesweeper::Minefield.new(4)) }
  end

  def test_print_warns_about_empty_minefield
    printer = MinefieldPrettyPrinter.new(EmptyMinefield.new())
    assert_raise(EmptyMinefieldError) { printer.print }
  end

  def test_when_minefield_size_is_N_prints_N_plus_1_rows
    printer = MinefieldPrettyPrinter.new(create_minefield_of_size(4))
    assert_equal(5, printer.print.count('\n'))
  end

  def test_when_minefield_size_is_N_prints_N_plus_1_columns
    printer = MinefieldPrettyPrinter.new(create_minefield_of_size(4))
    printer.print.each_line('\n') do |row| 
      assert_no_match(/\|\|/, row)
      assert_equal(5, row.count('|'))
    end
  end

  def test_print_makes_room_in_the_columns_header_for_the_rows_header
    printer = MinefieldPrettyPrinter.new(create_minefield_of_size(4))
    assert_match(/^ \|.*/, printer.print.lines('\n')[0])
  end

  def test_print_includes_a_column_header
    printer = MinefieldPrettyPrinter.new(create_minefield_of_size(4))
    assert_equal(' |0|1|2|3|\n', printer.print.lines('\n')[0])
  end

  def create_minefield_of_size(a_size)
    Minesweeper::Minefield.new(a_size)
  end

  def test_prints_lines_with_a_row_header
    printer = MinefieldPrettyPrinter.new(create_minefield_of_size(4))
    lines = printer.print.split('\n')[1..-1]
    lines.each { |line| assert_match(ROW_HEADER_REGEX, line) }
  end
end
