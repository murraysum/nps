module Nps
  class Configuration

    # Public: Retrieve or assign a persistance class to store the NPS votes.
    attr_accessor :persistance

    # Public: Initialize a new configuration for the library
    # with the default behaviour.
    def initialize
      @persistance = Nps::Ballot
    end
  end
end