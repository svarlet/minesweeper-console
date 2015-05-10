module Minesweeper
  module Console
    module PrettyPrinter
      class RowPrinter
        def initialize(separator)
          raise StandardError if separator.nil?
          @separator = separator
        end

        def print(row_number, raw_row)
          result = row_number.to_s + @separator
          raw_row.each_char do |c|
            result << c + @separator
          end
          result
        end
      end
    end
  end
end

