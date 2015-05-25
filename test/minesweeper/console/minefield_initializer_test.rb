require_relative '../../test_helper'
require 'minesweeper/console/minefield_initializer'

module Minesweeper
  module Console
    class MinefieldInitializerTest < Test::Unit::TestCase
      def test_is_initializable
        MinefieldInitializer.new
      end

      def test_generate_one_mine_should_return_an_array_of_2_integers_within_an_array
        mines = MinefieldInitializer.new.generate(1)
        assert_equal(1, mines.length)
        assert_equal(2, mines[0].length)
        assert_true(mines.pop.all? { |item| item.is_a? Integer })
      end

      def test_generate_many_mines_should_return_an_array_of_2_integers_per_mine_within_an_array
        mines = MinefieldInitializer.new.generate(2)
        assert_equal(2, mines.length)
        coords_validator = ->(coords) { coords[0].is_a?(Integer) && coords[1].is_a?(Integer) }
        # MUST CHECK THAT EACH COORD IS LENGTH = 2 !!!!!
        assert_true(mines.all?(&coords_validator)
      end

      def test_generate_should_generate_the_specified_quantity_of_mines
        omit('not ready yet')
        coords = MinefieldInitializer.new.generate(3)
        assert_equal(3, coords.length)
      end
    end
  end
end

