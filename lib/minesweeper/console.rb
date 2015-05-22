require_relative 'console/version'
require 'readline'
require 'minesweeper'
require_relative 'console/prettyprinter/minefield_pretty_printer'

module Minesweeper
  module Console
    class Game
      def initialize(size)
        @row_count = size
        @minefield = Minefield.new(@row_count)
        @pretty_printer = Console::PrettyPrinter::MinefieldPrettyPrinter.new(@minefield)
      end

      def start
        loop do
          puts @pretty_printer.print
          command = Readline.readline('> ', true)
        end
      end

    end
  end
end
