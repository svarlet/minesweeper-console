require_relative '../../test_helper'
require 'minesweeper/console/command_parser'

module Minesweeper
  module Console
    class CommandParserTest < Test::Unit::TestCase
      def setup
        @minefield = nil
        @sut = CommandParser.new('')
      end

      def test_raise_argument_error_when_initialize_parameter_is_nil
        assert_raise(ArgumentError) { CommandParser.new }
      end

      def test_does_not_raise_error_when_parsed_user_input_is_nil
        assert_nothing_raised(StandardError) { @sut.parse(nil) }
      end

      def test_does_not_raise_error_when_parsed_user_input_is_an_empty_string
        assert_nothing_raised(StandardError) { @sut.parse(nil) }
      end

      def test_does_not_raise_error_when_parsed_user_input_is_only_a_newline
        assert_nothing_raised(StandardError) { @sut.parse(nil) }
      end

      def test_raises_error_when_user_input_is_not_made_of_3_tokens
        fail('not implemented yet')
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

