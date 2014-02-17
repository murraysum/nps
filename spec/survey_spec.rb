require 'spec_helper'

describe Nps::Survey do
  describe 'with a survey' do
    before :each do
      @survey = Nps::Survey.new
      # Promoters
      @survey.vote!(10)
      @survey.vote!(9)
      # Passives
      @survey.vote!(8)
      @survey.vote!(7)
      # Detractors
      @survey.vote!(6)
      @survey.vote!(5)
      @survey.vote!(4)
      @survey.vote!(3)
      @survey.vote!(2)
      @survey.vote!(1)
      @survey.vote!(0)
    end

    it 'have a score' do
      @survey.score.should == -45.46
    end

    it 'have a percentage of promoters' do
      @survey.percentage_of_promoters.should == 18.18
    end

    it 'have a percentage of passives' do
      @survey.percentage_of_passives.should == 18.18
    end

    it 'have a percentage of detractors' do
      @survey.percentage_of_detractors.should == 63.64
    end
  end
end