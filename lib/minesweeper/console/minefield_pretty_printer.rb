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
      result = ""
      result = print_column_indexes(Math::sqrt(cell_sequence.length).to_i)
    end
  end

  def print_column_indexes(nb_columns)
    result = " |"
    nb_columns.times do |index|
      result << index.to_s + '|' 
    end
    result
  end
end
