require 'minesweeper'

module Minesweeper
  module Console
    class MinefieldInitializer
      def initialize(a_minefield)
        raise ArgumentError, 'A non nil minefield is required to create an instance.' if a_minefield.nil?
        @minefield = a_minefield
      end

      def generate(quantity_of_mines)
        raise ArgumentError, 'The specified quantity must be an integer.' unless quantity_of_mines.is_a?(Integer)
        raise ArgumentError, 'The specified quantity exceeds the minefield size.' if quantity_of_mines > @minefield.size * @minefield.size
        Array.new(quantity_of_mines) { |i| [i, 0] }
      end
    end
  end
end

