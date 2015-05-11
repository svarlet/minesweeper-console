module Minesweeper
  module Console
    module PrettyPrinter
      class RowPrinter
        def initialize(separator)
          raise StandardError if separator.nil?
          @separator = separator
        end

        def print(row_number, raw_row, column_width)
          raise StandardError if column_width.nil?
          raise StandardError if column_width < 1
          raise StandardError if column_width < row_number.to_s.length
          result = prepend_spaces_to(row_number.to_s, column_width) + @separator
          raw_row.each_char do |c|
            result << prepend_spaces_to(c, column_width) + @separator
          end
          result
        end

        def prepend_spaces_to(a_string, desired_length)
          missing_spaces = desired_length - a_string.length
          ' ' * missing_spaces + a_string
        end
      end
    end
  end
end

