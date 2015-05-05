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
      result = print_column_headers()
    end
  end

  def print_column_headers()
    result = " |"
    @minefield.size.times do |index|
      result << index.to_s + '|' 
    end
    result
  end

  def print_line(index)
    raise StandardError if index >= @minefield.size
    line = index.to_s + '|'
  end
end
