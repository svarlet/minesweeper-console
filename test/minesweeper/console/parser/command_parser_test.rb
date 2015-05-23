require_relative '../../../test_helper'
require 'minesweeper/console/parser/command_parser'
require 'minesweeper/console/parser/invalid_input_error'

module Minesweeper
  module Console
    module Parser
      class CommandParserTest < Test::Unit::TestCase
        def setup
          @minefield = nil
          @sut = CommandParser.new('')
        end

        def test_raise_argument_error_when_initialize_parameter_is_nil
          assert_raise(ArgumentError) { CommandParser.new }
        end

        def test_parse_returns_a_null_command_when_user_input_is_nil_or_empty_or_newline
          assert_instance_of(NullCommand, @sut.parse(nil))
          assert_instance_of(NullCommand, @sut.parse(''))
          assert_instance_of(NullCommand, @sut.parse("\n"))
          assert_instance_of(NullCommand, @sut.parse('    '))
          assert_instance_of(NullCommand, @sut.parse("\r"))
          assert_instance_of(NullCommand, @sut.parse("\t"))
        end

        def test_raises_error_when_user_input_is_not_made_of_3_tokens
          assert_raise(InvalidInputError) { @sut.parse("a_token") }
          assert_raise(InvalidInputError) { @sut.parse("a_token b_token") }
          assert_raise(InvalidInputError) { @sut.parse("a_token b_token c_token d_token") }
        end

        def test_raises_error_when_the_last_2_tokens_of_user_input_are_not_integers
          fail('not implemented yet')
        end

        def test_raises_error_when_the_first_token_is_not_supported
          fail('not implemented yet')
        end

        def test_returns_a_reveal_command_when_user_input_starts_with_r_or_R 
          assert_instance_of(RevealCommand, @sut.parse('r 0 0'))
          assert_instance_of(RevealCommand, @sut.parse('R 0 0'))
        end
      end
    end
  end
end

