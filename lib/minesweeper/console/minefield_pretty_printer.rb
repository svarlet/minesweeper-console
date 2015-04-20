require 'minesweeper'
require_relative 'empty_minefield_error'

class MinefieldPrettyPrinter
  def initialize(a_minefield)
    raise StandardError unless a_minefield
    @minefield = a_minefield
  end

  def print
    if (@minefield.to_s == "")
      raise EmptyMinefieldError
    end
  end

end
