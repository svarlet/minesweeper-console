require_relative '../../test_helper'
require 'minesweeper/console/minefield_initializer'
require 'minesweeper/minefield'

module Minesweeper
  module Console
    class MinefieldInitializerTest < Test::Unit::TestCase
      def test_is_initializable
        assert_raise(ArgumentError) { MinefieldInitializer.new(nil) }
        assert_nothing_raised(StandardError) { MinefieldInitializer.new(Minesweeper::Minefield.new(1)) }
      end

      def test_generate_raises_an_ArgumentError_if_desired_quantity_of_mines_exceeds_minefield_size
        a_minefield = Minesweeper::Minefield.new(1)
        sut = MinefieldInitializer.new(a_minefield)
        assert_raise(ArgumentError) { sut.generate(2) }
      end

      def test_generate_one_mine_should_return_an_array_of_length_1
        a_minefield = Minesweeper::Minefield.new(1)
        sut = MinefieldInitializer.new(a_minefield)
        mines = sut.generate(1)
        assert_equal(1, mines.length)
      end

      def test_generate_20_mines_should_return_an_array_of_length_20
        a_minefield = Minesweeper::Minefield.new(5)
        sut = MinefieldInitializer.new(a_minefield)
        mines = sut.generate(20)
        assert_equal(20, mines.length)
      end

      def test_each_mine_should_be_an_array_containing_2_integers
        a_minefield = Minesweeper::Minefield.new(2)
        sut = MinefieldInitializer.new(a_minefield)
        mines = sut.generate(2)
        mines.each do |coords|
          assert_equal(2, coords.length)
          assert_true(coords.all? { |c| c.is_a?(Integer) } )
        end
      end

      def test_each_mine_has_unique_coordinates
        a_minefield = Minesweeper::Minefield.new(2)
        sut = MinefieldInitializer.new(a_minefield)
        mines = sut.generate(2)
        assert_true(mines & mines == mines)
      end

      def test_when_generate_is_executed_twice_then_both_results_dont_match
        a_minefield = Minesweeper::Minefield.new(2)
        sut = MinefieldInitializer.new(a_minefield)
        some_mines = sut.generate(2)
        other_mines = sut.generate(2)
        assert_not_equal(some_mines, other_mines)
      end
    end
  end
end

