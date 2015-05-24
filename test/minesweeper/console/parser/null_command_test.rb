require_relative '../../../test_helper'
require 'minesweeper/console/parser/null_command'

module Minesweeper
  module Console
    module Parser
      class NullCommandTest < Test::Unit::TestCase
        def test_initializes_with_one_parameter
          NullCommand.new(nil)
        end

        def test_execute_does_nothing
          assert_nothing_raised(StandardError) { NullCommand.new(nil).execute }
        end
      end
    end
  end
end

