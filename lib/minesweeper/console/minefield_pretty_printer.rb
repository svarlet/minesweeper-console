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

  def print_column_indexes(biggest_index)
	result = ""
	biggest_index.times do |index|
	  result = result + '|' + index.to_s 
	end
	result = result + '|'
  end
end
