require 'readline'
require 'minesweeper'
require_relative 'prettyprinter/minefield_pretty_printer'
require_relative 'prettyprinter/theme/default_theme'
require_relative 'parser/command_parser'
require_relative 'mine_layer'
require_relative 'mine_coordinates_factory'

module Minesweeper
  module Console
    class GameLoop
      PROMPT = "(R)eveal, (F)lag, (U)nflag <x> <y>\n>"
      def initialize(size)
        @row_count = size
        @minefield = Minefield.new(@row_count)
        @pretty_printer = Console::PrettyPrinter::MinefieldPrettyPrinter.new(@minefield, Console::PrettyPrinter::Theme::DefaultTheme.new(Rainbow.new))
        @command_parser = Console::Parser::CommandParser.new(@minefield)
        mine_generator = MineCoordinatesFactory.new(Random.new)
        @mine_layer = MineLayer.new(@minefield, mine_generator)
      end

      def start
        @mine_layer.lay(@row_count)
        loop do
          puts @pretty_printer.print
          user_input = Readline.readline(PROMPT, true)
          @command_parser.parse(user_input).execute
        end
      end

    end
  end
end

