require_relative 'invalid_input_error'
require_relative 'null_command'

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
          tokens = user_input.split(/\s+/)
          if tokens.length != 3
            raise InvalidInputError, 'A valid input has 3 words.'
          end
        end
      end
    end
  end
end

