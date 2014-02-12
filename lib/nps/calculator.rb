module Nps
  class Calculator

    def initialize(ballot)
      @ballot = ballot
    end

    def score
      percentage_of_promoters - percentage_of_detractors
    end

    def percentage_of_promoters
      @ballot.votes? ? ((@ballot.promoters / @ballot.total_votes) * 100).round(2) : 0
    end

    def percentage_of_passives
      @ballot.votes? ? ((@ballot.passives / @ballot.total_votes) * 100).round(2) : 0
    end

    def percentage_of_detractors
      @ballot.votes? ? ((@ballot.detractors / @ballot.total_votes) * 100).round(2) : 0
    end

  end
end