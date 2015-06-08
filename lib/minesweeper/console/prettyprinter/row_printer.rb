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
          result = build_row_header(row_number, column_width)
          raw_row.each_char do |c|
            result << left_padding_for(c, column_width)
            if (c =~ /\d+/)
              result << @theme.colorize_mine_quantity(c)
            else
              result << @theme.colorize_cell_status(c)
            end
            result << @theme.colorize_separator(@separator)
          end
          result
        end

        def build_row_header(row_number, desired_length)
          result = left_padding_for(row_number.to_s, desired_length)
          result << @theme.colorize_header(row_number.to_s)
          result << @theme.colorize_separator(@separator)
        end

        def left_padding_for(string, desired_length)
          ' ' * (desired_length - string.length)
        end
      end
    end
  end
end

