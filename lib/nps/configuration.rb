module Nps
  class Configuration

    attr_accessor :persistance

    def initialize
      @persistance = Nps::Ballot
    end
  end
end