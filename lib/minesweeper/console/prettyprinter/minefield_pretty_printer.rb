require 'minesweeper'
require_relative 'header_printer'
require_relative 'row_printer'

module Minesweeper
  module Console
    module PrettyPrinter
      class MinefieldPrettyPrinter
        def initialize(a_minefield)
          raise StandardError if a_minefield.nil?
          @minefield = a_minefield
          @header_printer = HeaderPrinter.new('|')
          @row_printer = RowPrinter.new('|')
        end

        def print
          cells = @minefield.to_s
          nb_columns = Math.sqrt(@minefield.size).to_i
          result = generate_header(nb_columns) + generate_rows(cells, nb_columns)
        end

        def generate_header(nb_columns)
          @header_printer.print(nb_columns) + '\n'
        end

        def generate_rows(cells, nb_columns)
          max_column_width = (nb_columns - 1).to_s.length
          result = ''
          split_string_in_chunks(cells, nb_columns).each_with_index do |row, i|
            result << @row_printer.print(i, row, max_column_width) + '\n'
          end
          result
        end

        def split_string_in_chunks(a_string, chunk_size)
          a_string.scan(/.{#{chunk_size}}/)
        end

        private :split_string_in_chunks, :generate_header, :generate_rows
      end
    end
  end
end

