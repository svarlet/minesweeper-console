module Minesweeper
  module Console
    module Parser
      class UnflagCommand
        def initialize(a_minefield, x, y)
          @minefield = a_minefield
          @row_index = x
          @column_index = y
        end

        def execute
          @minefield.unflag_at(@row_index, @column_index)
        end
      end
    end
  end
end

