module Minesweeper
  module Console
    module PrettyPrinter
      module Theme
        class DefaultTheme
          def initialize(a_colorizer)
            @colorizer = a_colorizer
          end

          def colorize_header(a_string)
            @colorizer.wrap(a_string).white
          end

          def colorize_separator(a_string)
            a_string
          end

          def colorize_mine_quantity(a_string)
            if (a_string == '0')
              ' '
            else
              @colorizer.wrap(a_string).red
            end
          end

          def colorize_cell_status(a_string)
            @colorizer.wrap(a_string).yellow
          end
        end
      end
    end
  end
end

