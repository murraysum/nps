require 'spec_helper'

describe Nps::Calculator do
  describe 'with no votes' do
    before :each do
      @calculator = Nps::Calculator.new
    end

    it 'have zero promoters' do
      @calculator.promoters.should == 0
    end

    it 'have zero passives' do
      @calculator.passives.should == 0
    end

    it 'have zero detractors' do
      @calculator.detractors.should == 0
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

  describe 'with a promoter vote' do
    before :each do
      @calculator = Nps::Calculator.new
      @calculator.vote!(10)
    end

    it 'have a promoter' do
      @calculator.promoters.should == 1
    end

    it 'have zero passives' do
      @calculator.passives.should == 0
    end

    it 'have zero detractors' do
      @calculator.detractors.should == 0
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

  describe 'with a passive vote' do
    before :each do
      @calculator = Nps::Calculator.new
      @calculator.vote!(7)
    end

    it 'have zero promoters' do
      @calculator.promoters.should == 0
    end

    it 'have a passive' do
      @calculator.passives.should == 1
    end

    it 'have zero detractors' do
      @calculator.detractors.should == 0
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

  describe 'with a detractor vote' do
    before :each do
      @calculator = Nps::Calculator.new
      @calculator.vote!(0)
    end

    it 'have zero promoters' do
      @calculator.promoters.should == 0
    end

    it 'have zero passives' do
      @calculator.passives.should == 0
    end

    it 'have a detractor' do
      @calculator.detractors.should == 1
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

  describe 'with promoter, passive and detractor votes' do
    before :each do
      @calculator = Nps::Calculator.new
      # Promoters
      @calculator.vote!(10)
      @calculator.vote!(9)
      # Passives
      @calculator.vote!(8)
      @calculator.vote!(7)
      # Detractors
      @calculator.vote!(6)
      @calculator.vote!(5)
      @calculator.vote!(4)
      @calculator.vote!(3)
      @calculator.vote!(2)
      @calculator.vote!(1)
      @calculator.vote!(0)
    end

    it 'have promoters' do
      @calculator.promoters.should == 2
    end

    it 'have passives' do
      @calculator.passives.should == 2
    end

    it 'have detractors' do
      @calculator.detractors.should == 7
    end

    it 'have a score' do
      @calculator.score.should == BigDecimal.new('-45.46')
    end

    it 'have a percentage of promoters' do
      @calculator.percentage_of_promoters.should == BigDecimal.new('18.18')
    end

    it 'have a percentage of passives' do
      @calculator.percentage_of_passives.should == BigDecimal.new('18.18')
    end

    it 'have a percentage of detractors' do
      @calculator.percentage_of_detractors.should == BigDecimal.new('63.64')
    end
  end
end