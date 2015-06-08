module Minesweeper
  module Console
    class MineLayer
      def initialize(a_minefield, a_mine_generator)
        raise ArgumentError if a_minefield.nil?
        raise ArgumentError if a_mine_generator.nil?
        @generator = a_mine_generator
        @minefield = a_minefield
      end

      def lay(quantity)
        laid_mines = []
        quantity.times do
          loop do
            coords = @generator.create(@minefield.row_count)
            if laid_mines.include?(coords)
              next
            else
              laid_mines << coords
              @minefield.hide_mine_at(coords.row_index, coords.col_index)
              break
            end
          end
        end
      end
    end
  end
end

