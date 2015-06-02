module Minesweeper
  module Console
    module PrettyPrinter
      class HeaderPrinter
        def initialize(separator, theme)
          raise StandardError if separator.nil? || theme.nil?
          @separator = separator
        end

        def print(number_of_columns)
          raise StandardError if number_of_columns <= 0
          column_width = compute_column_width_for(number_of_columns)
          result = ' ' * column_width + @separator
          number_of_columns.times do |i|
            column_header = i.to_s
            column_header.prepend(' ' * (column_width - column_header.length))
            result << column_header + @separator
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

