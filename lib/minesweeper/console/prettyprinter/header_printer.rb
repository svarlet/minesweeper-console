module Minesweeper
  module Console
    module PrettyPrinter
      class HeaderPrinter
        def initialize(separator, theme)
          raise ArgumentError if separator.nil? || theme.nil?
          @separator = separator
          @theme = theme
        end

        def print(number_of_columns)
          raise ArgumentError if number_of_columns <= 0
          column_width = compute_column_width_for(number_of_columns)
          result = ' ' * column_width
          result << @theme.colorize_separator(@separator)
          number_of_columns.times do |i|
            column_header = @theme.colorize_header(i.to_s)
            column_header.prepend(' ' * (column_width - i.to_s.length))
            result << column_header
            result << @theme.colorize_separator(@separator)
          end
          result
        end

        def compute_column_width_for(number_of_columns)
          (number_of_columns - 1).to_s.length
        end
      end
    end
  end
end

