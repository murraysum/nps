require 'ostruct'

require "nps/version"
require "nps/calculator"
require "nps/survey"
require "nps/ballot"
require "nps/configuration"

module Nps
  extend self

  attr_accessor :configuration

  # Public: Set custom configuration options
  # such as how to store the NPS votes.
  #
  # Examples:
  #   Nps.configure do |config|
  #     config.ballot_adaptor = YourBallotAdaptor
  #   end
  #
  def configure
    self.configuration ||= Nps::Configuration.new
    yield(configuration) if block_given?
  end

  Nps.configure
end
