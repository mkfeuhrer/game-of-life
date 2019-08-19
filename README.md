# Gameoflife

## Problem Description

As a fan of games, I want to model [Convoy's game of life][6], with game starting from initial life state so that I can return state of life after each iteration.

### Requirements

- Any live cell with fewer than two live neighbours dies, as if by underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gameoflife'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install gameoflife
```

## Limitation

- Only shows initial life state
- No Grid Expansion

## Development

### Prerequisites

- [RVM][1] or [RBENV][2]. See respective website for installation instructions.
- [Bundler][3] (>= 2.0.1). Install using `gem install bundler`

### Setup

After checking out the repo,

- Run `rvm use` or `rbenv local` to switch to the configured Ruby version for this project.
- Run `bundle install --path vendor/bundle` to install dependencies.

### Run Instructions

- Run `ruby lib/gameoflife/application.rb`

### Running Tests

- Run `rake spec` to run all [RSpec][4] specs inside `spec`.
- Run `rake lint` to run [RuboCop][5] linter.

To install this gem onto your local machine, run `bundle exec rake install`.

[1]: https://rvm.io/
[2]: https://github.com/rbenv/rbenv
[3]: https://bundler.io/
[4]: https://rspec.info/
[5]: https://docs.rubocop.org/en/stable/
[6]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
