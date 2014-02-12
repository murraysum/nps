require 'spec_helper'

describe Nps::Ballot do
  
  describe 'initialize' do
    before :each do
      @ballot = Nps::Ballot.new
    end

    it 'have no promoter votes' do
      @ballot.promoters.should == 0
    end

    it 'have no passive votes' do
      @ballot.passives.should == 0
    end

    it 'have no detractor votes' do
      @ballot.detractors.should == 0
    end

    it 'have no votes' do
      @ballot.votes?.should be_false
    end

    it 'have no votes in all categories' do
      @ballot.total_votes.should == 0
    end
  end

  describe 'promoter vote' do
    before :each do
      @ballot = Nps::Ballot.new
      @ballot.vote!(10)
    end

    it 'have a promoters vote' do
      @ballot.promoters.should == 1
    end

    it 'have no passive votes' do
      @ballot.passives.should == 0
    end

    it 'have no detractor votes' do
      @ballot.detractors.should == 0
    end

    it 'have votes' do
      @ballot.votes?.should be_true
    end

    it 'have one vote' do
      @ballot.total_votes.should == 1
    end
  end

  describe 'passive vote' do
    before :each do
      @ballot = Nps::Ballot.new
      @ballot.vote!(8)
    end

    it 'have no promoter votes' do
      @ballot.promoters.should == 0
    end

    it 'have a passive vote' do
      @ballot.passives.should == 1
    end

    it 'have no detractor votes' do
      @ballot.detractors.should == 0
    end

    it 'have votes' do
      @ballot.votes?.should be_true
    end

    it 'have one vote' do
      @ballot.total_votes.should == 1
    end
  end

  describe 'detractor vote' do
    before :each do
      @ballot = Nps::Ballot.new
      @ballot.vote!(6)
    end

    it 'have no promoter votes' do
      @ballot.promoters.should == 0
    end

    it 'have no passive votes' do
      @ballot.passives.should == 0
    end

    it 'have a detractor vote' do
      @ballot.detractors.should == 1
    end

    it 'have votes' do
      @ballot.votes?.should be_true
    end

    it 'have one vote' do
      @ballot.total_votes.should == 1
    end
  end
end