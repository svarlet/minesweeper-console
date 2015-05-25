require 'minesweeper'

module Minesweeper
  module Console
    class MinefieldInitializer
      def initialize
      end

      def generate(number_of_mines)
        mines = []
        number_of_mines.times { mines << [0,0] }
        mines
      end
    end
  end
end

