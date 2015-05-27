require_relative '../../test_helper'
require 'minesweeper/console/mine_coordinate_factory'
require 'minesweeper/console/mine_coordinates'
require 'byebug'

module Minesweeper
  module Console
    class MineCoordinatesFactoryTest < Test::Unit::TestCase
      def test_initialize_takes_a_random_number_generator
        not_a_rng = Object.new
        assert_raise(ArgumentError) { MineCoordinatesFactory.new(not_a_rng) }
        assert_nothing_raised { MineCoordinatesFactory.new(Random.new) }
      end

      def test_create_should_return_a_pair_of_mine_coordinates
        sut = MineCoordinatesFactory.new(Random.new)
        mc = sut.create(1)
        assert_instance_of(MineCoordinates, mc)
      end

      def test_create_should_use_the_random_number_generator_to_produce_the_coordinates
        spy = RandomNumberGeneratorSpy.new
        sut = MineCoordinatesFactory.new(spy)
        upper_bound = 20

        mc = sut.create(upper_bound)

        assert_equal(upper_bound, spy.generated_numbers[0].max)
        assert_equal(mc.row_index, spy.generated_numbers[0].value)

        assert_equal(upper_bound, spy.generated_numbers[1].max)
        assert_equal(mc.col_index, spy.generated_numbers[1].value)
      end
    end

    class RandomNumberGeneratorSpy
      attr_reader :generated_numbers

      def initialize
        @generated_numbers = []
        @random_number_generator = Random.new
      end

      def rand(max)
        a_generated_number = RandomNumber.new(max, @random_number_generator.rand(max))
        @generated_numbers << a_generated_number
        a_generated_number.value
      end
    end

    class RandomNumber
      attr_reader :max, :value

      def initialize(max, value)
        @max = max
        @value = value
      end
    end
  end
end

