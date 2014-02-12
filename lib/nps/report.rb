module Nps
  class Report

    attr_reader :ballot

    def initialize
      @ballot = Nps::Ballot.new
    end

    def score
      calculator.score
    end

    def percentage_of_promoters
      calculator.percentage_of_promoters
    end

    def percentage_of_passives
      calculator.percentage_of_passives
    end

    def percentage_of_detractors
      calculator.percentage_of_detractors
    end

    def vote!(value)
      ballot.vote!(value)
    end

    private

    def calculator
      Nps::Calculator.new(ballot)
    end
  end

end

