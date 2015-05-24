require_relative 'invalid_command_parameters'
require_relative 'unsupported_command_error'
require_relative 'null_command'
require_relative 'reveal_command'
require_relative 'flag_command'
# require_relative 'unflag_command'

module Minesweeper
  module Console
    module Parser
      class CommandParser
        def initialize(a_minefield)
          raise ArgumentError if a_minefield.nil?
          @minefield = a_minefield
        end

        def parse(user_input)
          if user_input.nil? || user_input =~ /^\s*$/
            return NullCommand.new(@minefield)
          end
          validate_user_input(user_input)
          tokens = user_input.split(/\s+/)
          case tokens[0].upcase
          when 'R', 'REVEAL'
            RevealCommand.new(@minefield, *tokens[1,2])
          when 'F', 'FLAG'
            FlagCommand.new(@minefield, *tokens[1,2])
          when 'U', 'UNFLAG'
            UnflagCommand.new(@minefield, *tokens[1,2])
          end
        end

        def validate_user_input(user_input)
          if user_input !~ /^[RUFruf] .*$/
            raise UnsupportedCommandError, 'Supported commands are r,u,f,R,U,F.'
          end
          if user_input !~ /^.*\d+ \d+$/
            raise InvalidCommandParameters, 'A command must be followed by two integers.'
          end
        end

        private :validate_user_input
      end
    end
  end
end

