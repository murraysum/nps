module Nps
  class Configuration

    # Public: Retrieve or assign a ballot adaptor to store the NPS votes.
    attr_accessor :ballot_adaptor

    # Public: Initialize a new configuration for the library
    # with the default behaviour.
    def initialize
      @ballot_adaptor = Nps::Ballot
    end
  end
end