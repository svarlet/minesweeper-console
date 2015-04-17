require_relative 'console/version'
require 'readline'
require 'minesweeper'

module Minesweeper
  module Console
    class Main
      def initialize(size)
        @size = size
        @minefield = Minefield.new(size)
      end

      def start
        while command = Readline.readline('> ', true)
          puts "You just typed: #{command}"
          buffer = ''
          @minefield.to_s.each_char do |cell_state|
            buffer << cell_state
            if buffer.size == @size
              puts buffer
              buffer = ''
            end
          end
        end
      end

    end
  end
end
