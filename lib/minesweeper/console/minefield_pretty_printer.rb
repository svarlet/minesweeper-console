require 'minesweeper'
require_relative 'empty_minefield_error'

class MinefieldPrettyPrinter
  def initialize(a_minefield)
    raise StandardError unless a_minefield
    @minefield = a_minefield
  end

  def print
    cell_sequence = @minefield.to_s
    if (cell_sequence == "")
      raise EmptyMinefieldError
    else
      size = Math::sqrt(cell_sequence.length).to_i
      result = print_column_headers(size) + '\n'
      rows = cell_sequence.scan(/\w{#{size}}/)
      rows.each_with_index do |row, index|
        result << print_row(index, row) + '\n'
      end
      result
    end
  end

  def print_column_headers(nb_columns)
    result = " |"
    nb_columns.times do |index|
      result << index.to_s + '|' 
    end
    result
  end

  def print_row(row_index, a_raw_row)
    result = "#{row_index}|"
    a_raw_row.each_char { |c| result << "#{c}|" }
    result
  end
end
