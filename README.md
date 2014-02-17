# Nps

A Net Promoter Score (NPS) calculator; does exactly as it says on the tin.

## Installation

Add this line to your application's Gemfile:

    gem 'nps'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nps

## Usage

### Introduction
Firstly, create a new survey:
```
require 'nps'

survey = Nps::Survey.new
```

### Voting
Voting is simply achieved by:
```
# Promoter vote
survey.vote!(10)

# Passive vote
survey.vote!(8)

# Detractor vote
survey.vote!(6)
```

### NPS Calculation
The NPS score can be calculated by:
```
# Calculate the NPS score
survey.score
```

It is also useful to know the percentage of votes in each category:
```
# Show the percentage of promoters, passives and detractors
survey.percentage_of_promoters
survey.percentage_of_passives
survey.percentage_of_detractors
```

### Ballot Adaptor

By default NPS comes with an in-memory adapter `NPS::Ballot` for storing NPS votes. You can also optionally configure NPS to use a different adapter to store your votes in a database or another persistance store:

```
  Nps.configure do |config|
    config.ballot_adaptor = YourBallotAdapter
  end
```
To use a different adapter you must implement the same API as `NPS::Ballot`.

```
  class YourBallotAdaptor

    # Public: Initialize a Net Promoter Score ballot to store votes cast
    # on a survey.
    def initialize

    end

    # Public: Cast a vote with a given NPS value.
    #
    # value - The value of the vote on the NPS scale.
    # opts - A hash of meta data associated with the vote (default: {}) 
    def vote!(value, opts = {})

    end

    # Public: Whether any votes have been cast.
    def any_votes?

    end

    # Public: The total number of votes that have been cast.
    def total_votes

    end

    # Public: Find the votes that have been cast with a
    # NPS value in the range.
    #
    # range - The range of NPS values.
    def find_votes(range)

    end

    # Public: Count the votes that have been cast with a
    # NPS value in the range.
    #
    # range - The range of NPS values.
    def count_votes(range)

    end
  end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
