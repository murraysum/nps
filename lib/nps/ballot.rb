module Nps
  class Ballot

    def initialize
      @votes = []
    end

    def vote!(value, options = {})
      @votes << OpenStruct.new(
        :value => value.to_f,
        :options => options
      )
    end

    def any_votes?
      total_votes != 0
    end

    def total_votes
      @votes.count
    end

    def find_votes(range)
      @votes.select { |vote| range.include?(vote.value) }
    end

    def count_votes(range)
      find_votes(range).count
    end

  end
end