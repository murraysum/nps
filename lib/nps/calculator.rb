module Nps
  class Calculator

    def initialize(ballot)
      @ballot = ballot
    end

    def score
      percentage_of_promoters - percentage_of_detractors
    end

    def percentage_of_promoters
      @ballot.any_votes? ? ((promoters.to_f / @ballot.total_votes) * 100).round(2) : 0
    end

    def percentage_of_passives
      @ballot.any_votes? ? ((passives.to_f / @ballot.total_votes) * 100).round(2) : 0
    end

    def percentage_of_detractors
      @ballot.any_votes? ? ((detractors.to_f / @ballot.total_votes) * 100).round(2) : 0
    end

    private

    def promoters
      @ballot.count_votes(9..10)
    end

    def passives
      @ballot.count_votes(7..8)
    end

    def detractors
      @ballot.count_votes(0..6)
    end
  end
end