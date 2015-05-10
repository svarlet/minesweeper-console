module Minesweeper
  module Console
    module PrettyPrinter
      class HeaderPrinter
        def initialize(separator)
          raise StandardError if separator.nil?
        end

        def print(number_of_columns)
          raise StandardError if number_of_columns == 0
          raise StandardError if number_of_columns < 0
        end
      end
    end
  end
end

