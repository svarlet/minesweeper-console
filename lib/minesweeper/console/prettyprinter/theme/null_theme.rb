module Minesweeper
  module Console
    module PrettyPrinter
      module Theme
        class NullTheme
          def colorize_header(a_string)
            a_string
          end

          def colorize_separator(a_string)
            a_string
          end

          def colorize_mine_quantity(a_string)
            a_string
          end

          def colorize_cell_status(a_string)
            a_string
          end
        end
      end
    end
  end
end
