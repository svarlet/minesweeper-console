require 'minesweeper'

module Minesweeper
  module Console
    class MinefieldInitializer
      def initialize(a_minefield)
        raise ArgumentError, 'A non nil minefield is required to create an instance.' if a_minefield.nil?
        @minefield = a_minefield
      end

      def generate(quantity_of_mines)
        unless quantity_of_mines.is_a?(Integer)
          raise ArgumentError, 'The specified quantity must be an integer.'
        end

        if quantity_of_mines > @minefield.size * @minefield.size
          raise ArgumentError, 'The specified quantity exceeds the minefield size.'
        end

        mines = []
        quantity_of_mines.times do
          loop do
            a_mine = [rand(@minefield.size), rand(@minefield.size)]
            if mines.include?(a_mine)
              next
            else
              mines << a_mine
              break
            end
          end
        end
        mines
      end
    end
  end
end

