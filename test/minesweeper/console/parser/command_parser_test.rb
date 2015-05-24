require_relative '../../../test_helper'
require 'minesweeper/console/parser/command_parser'
require 'minesweeper/console/parser/invalid_input_error'
require 'minesweeper/console/parser/reveal_command'
require 'minesweeper/console/parser/flag_command'
require 'minesweeper/console/parser/unflag_command'

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

        def test_raises_error_when_the_first_token_is_not_a_supported_command
          assert_raise(UnsupportedCommandError) { @sut.parse('? 0 0')}
        end

        def test_raises_error_when_the_last_2_tokens_of_user_input_are_not_integers
          assert_raise(InvalidCommandParameters) { @sut.parse("R str str") }
          assert_raise(InvalidCommandParameters) { @sut.parse("R 0 str") }
          assert_raise(InvalidCommandParameters) { @sut.parse("R str 0") }
        end

        def test_returns_a_reveal_command_when_first_token_of_user_input_is_R_or_r
          assert_instance_of(RevealCommand, @sut.parse('r 0 0'))
          assert_instance_of(RevealCommand, @sut.parse('R 0 0'))
        end

        def test_returns_a_flag_command_when_first_token_of_user_input_is_f_or_F
          assert_instance_of(FlagCommand, @sut.parse('f 0 0') )
          assert_instance_of(FlagCommand, @sut.parse('F 0 0') )
        end

        def test_parse_returns_an_unflag_command_when_first_token_of_user_input_is_u_or_U
          assert_instance_of(UnflagCommand, @sut.parse('u 0 0') )
          assert_instance_of(UnflagCommand, @sut.parse('U 0 0') )
        end
      end
    end
  end
end

