module Minesweeper
  module Console
    module PrettyPrinter
      class RowPrinter
        def initialize(separator, theme)
          raise ArgumentError if separator.nil? || theme.nil?
          @separator = separator
          @theme = theme
        end

        def print(row_number, raw_row, column_width)
          raise ArgumentError if column_width.nil?
          raise ArgumentError if column_width < 1
          raise ArgumentError if column_width < row_number.to_s.length
          colorized_row_number = @theme.colorize_header(row_number.to_s)
          result = ' ' * (column_width - row_number.to_s.length) + colorized_row_number 
          result << @theme.colorize_separator(@separator)
          raw_row.each_char do |c|
            result << ' ' * (column_width - c.length)
            if (c =~ /\d+/)
              result << @theme.colorize_mine_quantity(result)
            else
              result << @theme.colorize_cell_status(result)
            end
            result << @theme.colorize_separator(@separator)
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

