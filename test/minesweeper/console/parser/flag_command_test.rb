require_relative '../../../test_helper'
require 'minesweeper/console/parser/flag_command'
require_relative 'minefield_spy'

module Minesweeper
  module Console
    module Parser
      class FlagCommandTest < Test::Unit::TestCase
        def test_initialize_requires_a_minefield_and_2_coordinates
          assert_nothing_raised { FlagCommand.new(nil, 4, 19) }
        end

        def test_execute_should_call_flag_at_on_the_minefield_object
          spy = MinefieldSpy.new
          sut = FlagCommand.new(spy, 4, 19)
          sut.execute
          assert_equal(1, spy.methods_called.length)
          assert_equal([:flag_at, 4, 19], spy.methods_called.pop)
        end
      end
    end
  end
end

