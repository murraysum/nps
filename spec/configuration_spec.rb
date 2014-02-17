require 'spec_helper'

describe Nps::Configuration do

  describe 'with default options' do
    before :each do
      @configuration = Nps::Configuration.new
    end

    it 'should set the default ballot engine' do
      @configuration.ballot_engine == Nps::Ballot
    end
  end

  describe 'with custom options' do
    before :each do
      @configuration = Nps::Configuration.new
      @configuration.ballot_engine = Struct
    end

    it 'should set a custom ballot engine' do
      @configuration.ballot_engine == Struct
    end
  end
end