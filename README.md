# Mastermind

My implementation of Mastermind - a code-breaking game for two players. Please see <a href="http://en.wikipedia.org/wiki/Mastermind_(board_game)">Wikipedia article</a> for extendet info.

## Installation - NOT TESTED!!

Add this line to your application's Gemfile:

    gem 'mastermind'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mastermind

## Usage

To play the game run:

    ruby Mastermind\run_game\play.rb

Setup mode will begin and you will be able to set:

    1. number of players
    2. Name of each player
    3. Role of each player

After that, play mode will begin and you will be able to setup the code and hack the code.

If you choose to play against AI, you can be either hacker or mastermind. Try to be faster than the AI code breaker!! It's almost perfect :)

## Still in developement stage!!

AI is based on Donald Knuth Five-guess algorithm, but it's not completed yet. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
