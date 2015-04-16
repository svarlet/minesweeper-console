require_relative "console/version"
require "readline"

module Minesweeper
  module Console
    class Main
      def start


        #Testing readline...
        while buf = Readline.readline("> ", true)
          puts "You just typed: " + buf
        end
      end
    end
  end
end
