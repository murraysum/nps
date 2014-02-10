module Nps
  class Calculator

    attr_reader :promoters, :passives, :detractors

    def initialize
      @promoters = BigDecimal.new('0.0')
      @passives = BigDecimal.new('0.0')
      @detractors = BigDecimal.new('0.0')
    end

    def vote!(value)
      if promoter?(value)
        @promoters += 1
      elsif passive?(value)
        @passives += 1
      elsif detractor?(value)
        @detractors += 1
      end
    end

    def score
      percentage_of_promoters - percentage_of_detractors
    end

    def percentage_of_promoters
      any_votes? ? ((promoters / total_votes) * 100).round(2) : 0
    end

    def percentage_of_passives
      any_votes? ? ((passives / total_votes) * 100).round(2) : 0
    end

    def percentage_of_detractors
      any_votes? ? ((detractors / total_votes) * 100).round(2) : 0
    end

    private

    def promoter?(value)
      value >= 9 && value <= 10
    end

    def passive?(value)
      value >= 7 && value <= 8
    end

    def detractor?(value)
      value >= 0 && value <= 6
    end

    def any_votes?
      total_votes != 0
    end

    def total_votes
      promoters + passives + detractors
    end

  end
end