module Nps
  class Calculator

    # Internal: Initialize a Net Promoter Score (NPS) calculator
    #
    # ballot - a ballot of votes in the NPS survey.
    def initialize(ballot)
      @ballot = ballot
    end

    # Internal: The Net Promoter Score (NPS) calculated from the ballot.
    def score
      percentage_of_promoters - percentage_of_detractors
    end

    # Internal: The percentage of promoter votes in the ballot.
    def percentage_of_promoters
      @ballot.any_votes? ? ((promoters.to_f / @ballot.total_votes.to_f) * 100.0).round(2) : 0.0
    end

    # Internal: The percentage of passive votes in the ballot.
    def percentage_of_passives
      @ballot.any_votes? ? ((passives.to_f / @ballot.total_votes.to_f) * 100.0).round(2) : 0.0
    end

    # Internal: The percentage of detractor votes in the ballot.
    def percentage_of_detractors
      @ballot.any_votes? ? ((detractors.to_f / @ballot.total_votes.to_f) * 100.0).round(2) : 0.0
    end

    private

    # Internal: The number of promoters in the ballot.
    def promoters
      @ballot.count_votes(9..10)
    end

    # Internal: The number of passives in the ballot.
    def passives
      @ballot.count_votes(7..8)
    end

    # Internal: The number of detractors in the ballot.
    def detractors
      @ballot.count_votes(0..6)
    end
  end
end