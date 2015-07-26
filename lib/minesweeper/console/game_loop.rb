require 'readline'
require 'minesweeper/core'
require 'rainbow'
require_relative 'prettyprinter/minefield_pretty_printer'
require_relative 'prettyprinter/theme/default_theme'
require_relative 'parser/command_parser'
require_relative 'parser/unsupported_command_error'
require_relative 'parser/invalid_command_parameters_error'

module Minesweeper
  module Console
    class GameLoop
      PROMPT = "(R)eveal, (F)lag, (U)nflag <x> <y>\n>"
      def initialize(size)
        @row_count = size
        @minefield = Core::Minefield.new(@row_count)
        @pretty_printer = Console::PrettyPrinter::MinefieldPrettyPrinter.new(@minefield, Console::PrettyPrinter::Theme::DefaultTheme.new(Rainbow.new))
        @command_parser = Console::Parser::CommandParser.new(@minefield)
        mine_generator = Core::Explosives::MineCoordinatesFactory.new(Random.new)
        @mine_layer = Core::Explosives::MineLayer.new(@minefield, mine_generator)
      end

      def start
        @mine_layer.lay(@row_count)
        loop do
          begin
            puts @pretty_printer.print
            user_input = Readline.readline(PROMPT, true)
            @command_parser.parse(user_input).execute
          rescue RangeError => e
            print_error('Please type coordinates within the minefield range.')
          rescue Parser::UnsupportedCommandError, Parser::InvalidCommandParametersError => e
            print_error(e.message)
          rescue Minesweeper::Explosives::ExplosionError => e
            print_error(e.message)
            exit
          rescue MinefieldSolvedError
            print_victory
            exit
          end
        end
      end

      def print_error(message)
        wrap_with_pretty_lines Rainbow(message).yellow.bright
      end

      def wrap_with_pretty_lines(message)
        puts '-' * 79, message, '-' * 79
      end

      def print_victory
        wrap_with_pretty_lines Rainbow('Congratulations! You flagged all mines.').green.bright
      end
    end
  end
end

