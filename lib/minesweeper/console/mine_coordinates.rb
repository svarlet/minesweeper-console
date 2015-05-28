module Minesweeper
  module Console
    class MineCoordinates
      attr_reader :row_index, :col_index

      def initialize(row_index, col_index)
        raise ArgumentError, "Integers required, got #{row_index} #{col_index}." unless row_index.is_a?(Integer) && col_index.is_a?(Integer)
        @row_index = row_index
        @col_index = col_index
      end

      def ==(an_object)
        self.class == an_object.class &&
          self.row_index == an_object.row_index &&
          self.col_index == an_object.col_index
      end
      alias eql? :==

      def hash
        [@row_index, @col_index].hash
      end
    end
  end
end
