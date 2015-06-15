[![Build Status](https://travis-ci.org/svarlet/minesweeper-console.svg?branch=master)](https://travis-ci.org/svarlet/minesweeper-console)
[![Coverage Status](https://coveralls.io/repos/svarlet/minesweeper-console/badge.svg?branch=master)](https://coveralls.io/r/svarlet/minesweeper-console?branch=master)

# Minesweeper::Console

A command line frontend to my minesweeper game. It is based on my [minesweeper-core gem](https://github.com/svarlet/minesweeper-core).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minesweeper-console'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minesweeper-console

## Usage

The provided executable takes one integer parameter to set the number of rows and columns.
Therefore the minefield will always be a square. The number of mines randomly placed within the minefield is also equal to N.

```
# minesweeper N
```

Have fun !

## Contributing

1. Fork it ( https://github.com/[my-github-username]/minesweeper-console/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
