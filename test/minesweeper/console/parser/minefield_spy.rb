module Minesweeper
  module Console
    module Parser
      class MinefieldSpy
        attr_reader :methods_called

        def initialize
          @methods_called = []
        end

        def reveal_at(x, y)
          @methods_called << [:reveal_at, x, y]
        end

        def flag_at(x, y)
          @methods_called << [:flag_at, x, y]
        end

        def unflag_at(x, y)
          @methods_called << [:unflag_at, x, y]
        end
      end
    end
  end
end

