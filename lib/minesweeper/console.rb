require_relative 'console/version'
require 'readline'
require 'minesweeper'
require_relative 'console/prettyprinter/minefield_pretty_printer'
require 'byebug'

module Minesweeper
  module Console
    class Game
      def initialize(size)
        @size = size
        @minefield = Minefield.new(size)
        @pretty_printer = Console::PrettyPrinter::MinefieldPrettyPrinter.new(@minefield)
      end

      def start
        loop do
          byebug
          puts @pretty_printer.print
          command = Readline.readline('> ', true)
        end
      end

    end
  end
end
