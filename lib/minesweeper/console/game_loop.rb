require 'readline'
require 'minesweeper'
require_relative 'prettyprinter/minefield_pretty_printer'
require_relative 'parser/command_parser'

module Minesweeper
  module Console
    class GameLoop
      PROMPT = "(R)eveal, (F)lag, (U)nflag <x> <y>\n>"
      def initialize(size)
        @row_count = size
        @minefield = Minefield.new(@row_count)
        @pretty_printer = Console::PrettyPrinter::MinefieldPrettyPrinter.new(@minefield)
        @command_parser = Console::Parser::CommandParser.new(@minefield)
      end

      def start
        loop do
          puts @pretty_printer.print
          user_input = Readline.readline(PROMPT, true)
          @command_parser.parse(user_input).execute
        end
      end

    end
  end
end

