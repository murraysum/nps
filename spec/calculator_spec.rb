require 'spec_helper'

describe Nps::Calculator do
  describe 'with an empty ballot' do
    before :each do
      @ballot = Nps::Ballot.new
      @calculator = Nps::Calculator.new(@ballot)
    end

    it 'have a zero score' do
      @calculator.score.should == 0
    end

    it 'have zero percentage of promoters' do
      @calculator.percentage_of_promoters.should == 0
    end

    it 'have zero percentage of passives' do
      @calculator.percentage_of_passives.should == 0
    end

    it 'have zero percentage of detractors' do
      @calculator.percentage_of_detractors.should == 0
    end
  end

  describe 'with a promoter ballot' do
    before :each do
      @ballot = Nps::Ballot.new
      @calculator = Nps::Calculator.new(@ballot)
      @ballot.vote!(10)
    end

    it 'have a score' do
      @calculator.score.should == 100
    end

    it 'have percentage of promoters' do
      @calculator.percentage_of_promoters.should == 100
    end

    it 'have zero percentage of passives' do
      @calculator.percentage_of_passives.should == 0
    end

    it 'have zero percentage of detractors' do
      @calculator.percentage_of_detractors.should == 0
    end
  end

  describe 'with a passive ballot' do
    before :each do
      @ballot = Nps::Ballot.new
      @calculator = Nps::Calculator.new(@ballot)
      @ballot.vote!(7)
    end

    it 'have a score' do
      @calculator.score.should == 0
    end

    it 'have zero percentage of promoters' do
      @calculator.percentage_of_promoters.should == 0
    end

    it 'have a percentage of passives' do
      @calculator.percentage_of_passives.should == 100
    end

    it 'have zero percentage of detractors' do
      @calculator.percentage_of_detractors.should == 0
    end
  end

  describe 'with a detractor ballot' do
    before :each do
      @ballot = Nps::Ballot.new
      @calculator = Nps::Calculator.new(@ballot)
      @ballot.vote!(0)
    end

    it 'have a score' do
      @calculator.score.should == -100
    end

    it 'have zero percentage of promoters' do
      @calculator.percentage_of_promoters.should == 0
    end

    it 'have zero percentage of passives' do
      @calculator.percentage_of_passives.should == 0
    end

    it 'have a percentage of detractors' do
      @calculator.percentage_of_detractors.should == 100
    end
  end

  describe 'with a mixed ballot' do
    before :each do
      @ballot = Nps::Ballot.new
      @calculator = Nps::Calculator.new(@ballot)
      # Promoters
      @ballot.vote!(10)
      @ballot.vote!(9)
      # Passives
      @ballot.vote!(8)
      @ballot.vote!(7)
      # Detractors
      @ballot.vote!(6)
      @ballot.vote!(5)
      @ballot.vote!(4)
      @ballot.vote!(3)
      @ballot.vote!(2)
      @ballot.vote!(1)
      @ballot.vote!(0)
    end

    it 'have a score' do
      @calculator.score.should == -45.46
    end

    it 'have a percentage of promoters' do
      @calculator.percentage_of_promoters.should == 18.18
    end

    it 'have a percentage of passives' do
      @calculator.percentage_of_passives.should == 18.18
    end

    it 'have a percentage of detractors' do
      @calculator.percentage_of_detractors.should == 63.64
    end
  end
end