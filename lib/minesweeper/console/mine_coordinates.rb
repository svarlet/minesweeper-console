module Minesweeper
  module Console
    class MineCoordinates
      include Comparable

      attr_reader :row_index, :col_index

      def initialize(row_index, col_index)
        raise ArgumentError, "Integers required, got #{row_index} #{col_index}." unless row_index.is_a?(Integer) && col_index.is_a?(Integer)
        @row_index = row_index
        @col_index = col_index
      end

      def ==(other)
        self.class == other.class &&
          self.row_index == other.row_index &&
          self.col_index == other.col_index
      end
      alias eql? :==

      def hash
        [@row_index, @col_index].hash
      end
    end
  end
end

