module Minesweeper
  module Console
    module PrettyPrinter
      class HeaderPrinter
        def initialize(separator)
          raise StandardError if separator.nil?
          @separator = separator
        end

        def print(number_of_columns)
          raise StandardError if number_of_columns == 0
          raise StandardError if number_of_columns < 0
          result = ' ' * number_of_columns.to_s.length + @separator
        end
      end
    end
  end
end

