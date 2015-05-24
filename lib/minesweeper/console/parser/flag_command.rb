module Minesweeper
  module Console
    module Parser
      class FlagCommand
        def initialize(a_minefield, x, y)
          raise ArgumentError unless (x.is_a?(Integer) && y.is_a?(Integer))
          @minefield = a_minefield
          @row_index = x
          @column_index = y
        end

        def execute
          @minefield.flag_at(@row_index, @column_index)
        end
      end
    end
  end
end

