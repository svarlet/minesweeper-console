require_relative '../../../test_helper'
require_relative 'minefield_spy'
require 'minesweeper/console/parser/reveal_command'

module Minesweeper
  module Console
    module Parser
      class RevealCommandTest < Test::Unit::TestCase
        def test_initializes_requires_a_minefield_parameter_and_2_coordinates
          assert_raise(ArgumentError) { RevealCommand.new }
          assert_raise(ArgumentError) { RevealCommand.new(nil) }
          assert_raise(ArgumentError) { RevealCommand.new(nil, 4) }
          assert_raise(ArgumentError) { RevealCommand.new(nil, '4', '19') }
          assert_nothing_raised { RevealCommand.new(nil, 4, 19) }
        end

        def test_execute_only_delegate_to_the_reveal_method_of_the_minefield_object
          spy = MinefieldSpy.new
          sut = RevealCommand.new(spy, 4, 19)
          sut.execute
          assert_equal(1, spy.methods_called.length)
          assert_equal([:reveal_at, 4, 19], spy.methods_called.pop)
        end
      end
    end
  end
end

