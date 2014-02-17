require 'spec_helper'

describe Nps::Configuration do

  describe 'with default options' do
    before :each do
      @configuration = Nps::Configuration.new
    end

    it 'should set the default ballot adaptor' do
      @configuration.ballot_adaptor == Nps::Ballot
    end
  end

  describe 'with custom options' do
    before :each do
      @configuration = Nps::Configuration.new
      @configuration.ballot_adaptor = Struct
    end

    it 'should set a custom ballot adaptor' do
      @configuration.ballot_adaptor == Struct
    end
  end
end