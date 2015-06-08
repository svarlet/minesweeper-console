require 'readline'
require 'minesweeper'
require_relative 'prettyprinter/minefield_pretty_printer'
require_relative 'prettyprinter/theme/default_theme'
require_relative 'parser/command_parser'
require_relative 'mine_layer'
require_relative 'mine_coordinates_factory'
require_relative 'parser/unsupported_command_error'
require_relative 'parser/invalid_command_parameters_error'

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
          begin
          puts @pretty_printer.print
          user_input = Readline.readline(PROMPT, true)
          @command_parser.parse(user_input).execute
          rescue Parser::UnsupportedCommandError, Parser::InvalidCommandParametersError => e
            puts e.message
          rescue Minesweeper::Explosives::ExplosionError => e
            puts e.message
            exit
          end
        end
      end

    end
  end
end

