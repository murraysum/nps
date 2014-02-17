module Nps
  class Configuration

    # Public: Retrieve or assign a ballot engine to store the NPS votes.
    attr_accessor :ballot_engine

    # Public: Initialize a new configuration for the library
    # with the default behaviour.
    def initialize
      @ballot_engine = Nps::Ballot
    end
  end
end