module Nps
  class Ballot

    # Public: Initialize a Net Promoter Score ballot to store votes cast
    # on a survey.
    def initialize
      @votes = []
    end

    # Public: Cast a vote with a given NPS value.
    #
    # value - The value of the vote on the NPS scale.
    # opts - A hash of meta data associated with the vote (default: {}) 
    def vote!(value, opts = {})
      vote = OpenStruct.new(:value => value.to_f, :options => opts)
      @votes << vote
      vote
    end

    # Public: Whether any votes have been cast.
    def any_votes?
      total_votes != 0
    end

    # Public: The total number of votes that have been cast.
    def total_votes
      @votes.count
    end

    # Public: Find the votes that have been cast with a
    # NPS value in the range.
    #
    # range - The range of NPS values.
    def find_votes(range)
      @votes.select { |vote| range.include?(vote.value) }
    end

    # Public: Count the votes that have been cast with a
    # NPS value in the range.
    #
    # range - The range of NPS values.
    def count_votes(range)
      find_votes(range).count
    end
  end
end