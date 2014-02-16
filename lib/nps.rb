require 'bigdecimal'
require 'ostruct'

require "nps/version"
require "nps/calculator"
require "nps/survey"
require "nps/ballot"
require "nps/configuration"

module Nps
  extend self

  attr_accessor :configuration

  def configure
    self.configuration ||= Nps::Configuration.new
    yield(configuration)
  end
end
