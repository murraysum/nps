require 'spec_helper'

describe Nps::Configuration do

  describe 'with default options' do
    before :each do
      @configuration = Nps::Configuration.new
    end

    it 'should set the default persistance engine' do
      @configuration.persistance == Nps::Ballot
    end
  end

  describe 'with custom options' do
    before :each do
      @configuration = Nps::Configuration.new
      @configuration.persistance = Struct
    end

    it 'should set a custom persistance engine' do
      @configuration.persistance == Struct
    end
  end
end