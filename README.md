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

Firstly, create a new survey:
```
require 'nps'

survey = Nps::Survey.new
```

Voting is simply achieved by:
```
# Promoter vote
survey.vote!(10)

# Passive vote
survey.vote!(8)

# Detractor vote
survey.vote!(6)
```

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
