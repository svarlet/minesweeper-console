require_relative 'console/version'
require 'readline'
require 'minesweeper'

module Minesweeper
  module Console
    class Game
      def initialize(size)
        @size = size
        @minefield = Minefield.new(size)
      end

      def start
        #todo: pretty print the minefield
        #todo: change prompt to show commands that can be used
        while command = Readline.readline('> ', true)
          #todo: validate command
          #todo: update minefield with the command
        end
      end

    end
  end
end
