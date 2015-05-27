require_relative 'mine_coordinates'

module Minesweeper
  module Console
    class MineCoordinatesFactory
      def initialize(random_number_generator)
        raise ArgumentError unless random_number_generator.respond_to? :rand
        @rng = random_number_generator
      end

      def create(coordinates_upper_bound)
        row_index = @rng.rand(coordinates_upper_bound)
        col_index = @rng.rand(coordinates_upper_bound)
        MineCoordinates.new(row_index, col_index)
      end
    end
  end
end

