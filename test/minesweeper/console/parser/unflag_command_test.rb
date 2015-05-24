require_relative '../../../test_helper'
require 'minesweeper/console/parser/unflag_command'
require_relative 'minefield_spy'

module Minesweeper
  module Console
    module Parser
      class UnflagCommandTest < Test::Unit::TestCase
        def test_initialize_requires_a_minefield_and_2_coordinates
          assert_raise(ArgumentError) { UnflagCommand.new }
          assert_raise(ArgumentError) { UnflagCommand.new(nil) }
          assert_raise(ArgumentError) { UnflagCommand.new(nil, 0) }
          assert_nothing_raised { UnflagCommand.new(nil, 0, 0) }
        end

        def test_execute_should_call_unflag_at_on_the_minefield_object
          spy = MinefieldSpy.new
          sut = UnflagCommand.new(spy, 4, 19)
          sut.execute
          assert_equal(1, spy.methods_called.length)
          assert_equal([:unflag_at, 4, 19], spy.methods_called.pop)
        end
      end
    end
  end
end

