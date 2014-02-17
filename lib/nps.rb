require 'ostruct'

require "nps/version"
require "nps/calculator"
require "nps/survey"
require "nps/ballot"
require "nps/configuration"

module Nps
  extend self

  attr_accessor :configuration

  # Public: Set configuration options for the library
  #
  # Examples:
  #   Nps.configure do |config|
  #     config.persistance = PersistanceClass
  #   end
  #
  def configure
    self.configuration ||= Nps::Configuration.new
    yield(configuration) if block_given?
  end

  Nps.configure
end
