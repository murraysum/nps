module Nps
  class Survey

    attr_reader :ballot

    # Public: Initialize a Net Promoter Score (NPS) survey
    #
    # Example:
    #   survey = Nps::Survey.new
    #   survey.vote!(10)
    #   survey.score
    #
    def initialize
      @ballot = Nps.configuration.ballot_engine.new
    end

    # Public: The Net Promoter Score (NPS) for the survey.
    def score
      calculator.score
    end

    # Public: The percentage of promoter votes in the survey.
    def percentage_of_promoters
      calculator.percentage_of_promoters
    end

    # Public: The percentage of passive votes in the survey.
    def percentage_of_passives
      calculator.percentage_of_passives
    end

    # Public: The percentage of detractor votes in the survey.
    def percentage_of_detractors
      calculator.percentage_of_detractors
    end

    # Public: Add a vote to the survey with the given value
    #
    # value - The value of the vote on the NPS scale (0..10)
    def vote!(value)
      ballot.vote!(value)
    end

    private

    # Internal: The Net Promoter Score Calculator
    def calculator
      Nps::Calculator.new(ballot)
    end
  end

end

