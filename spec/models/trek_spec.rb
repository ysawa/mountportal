require 'spec_helper'

describe Trek do
  it 'can be initialized' do
    trek = Trek.new
    trek.should_not be_persisted
  end

  describe '#name' do
    it 'is required' do
      trek = Trek.new(name: '')
      trek.save.should be_false
    end
  end

  describe '#scheduled_from' do
    it 'should be a Time' do
      trek = Trek.new(name: '')
      trek.scheduled_from == nil
      trek.scheduled_from = Time.now
      trek.scheduled_from.should be_a Time
    end
  end

  describe '#scheduled_from_date' do
    before :each do
      @trek = Trek.new(name: '')
    end
    it 'should be a Date' do
      @trek.scheduled_from_date == nil
      now = Time.now
      @trek.scheduled_from = now
      @trek.scheduled_from_date.should be_a Date
      @trek.scheduled_from_date.year.should == now.year
      @trek.scheduled_from_date.month.should == now.month
      @trek.scheduled_from_date.day.should == now.day
    end

    it 'can be assigned' do
      @trek.scheduled_from_date = '2012-01-23'
      @trek.scheduled_from.year.should == 2012
      @trek.scheduled_from.month.should == 1
      @trek.scheduled_from.day.should == 23
      @trek.scheduled_from.hour.should == 0
      @trek.scheduled_from.min.should == 0
      @trek.scheduled_from.sec.should == 0
      @trek.scheduled_from = '2012-01-23 12:34'
      @trek.scheduled_from_date = '2013-03-12'
      @trek.scheduled_from.year.should == 2013
      @trek.scheduled_from.month.should == 3
      @trek.scheduled_from.day.should == 12
      @trek.scheduled_from.hour.should == 12
      @trek.scheduled_from.min.should == 34
      @trek.scheduled_from.sec.should == 0
    end
  end

  describe '#scheduled_from_time' do
    before :each do
      @trek = Trek.new(name: '')
    end

    it 'should be a Integer' do
      @trek.scheduled_from_time == nil
      now = '2013-01-01 01:23'
      @trek.scheduled_from = now
      @trek.scheduled_from_time.should be_a Integer
      @trek.scheduled_from_time.should == 1 * 3600 + 23 * 60
    end
  end

  describe '#scheduled_to' do
    before :each do
      @trek = Trek.new(name: '')
    end

    it 'should be a Time' do
      @trek.scheduled_to == nil
      @trek.scheduled_to = Time.now
      @trek.scheduled_to.should be_a Time
    end
  end

  describe '#scheduled_to_date' do
    before :each do
      @trek = Trek.new(name: '')
    end

    it 'should be a Date' do
      @trek.scheduled_to_date == nil
      now = Time.now
      @trek.scheduled_to = now
      @trek.scheduled_to_date.should be_a Date
      @trek.scheduled_to_date.year.should == now.year
      @trek.scheduled_to_date.month.should == now.month
      @trek.scheduled_to_date.day.should == now.day
    end
  end

  describe '#scheduled_to_time' do
    before :each do
      @trek = Trek.new(name: '')
    end

    it 'should be a Integer' do
      @trek.scheduled_to_time == nil
      now = '2013-01-01 01:23'
      @trek.scheduled_to = now
      @trek.scheduled_to_time.should be_a Integer
      @trek.scheduled_to_time.should == 1 * 3600 + 23 * 60
    end

    it 'can be assigned' do
      @trek.scheduled_to_date = '2012-01-23'
      @trek.scheduled_to.year.should == 2012
      @trek.scheduled_to.month.should == 1
      @trek.scheduled_to.day.should == 23
      @trek.scheduled_to.hour.should == 0
      @trek.scheduled_to.min.should == 0
      @trek.scheduled_to.sec.should == 0
      @trek.scheduled_to = '2012-01-23 12:34'
      @trek.scheduled_to_date = '2013-03-12'
      @trek.scheduled_to.year.should == 2013
      @trek.scheduled_to.month.should == 3
      @trek.scheduled_to.day.should == 12
      @trek.scheduled_to.hour.should == 12
      @trek.scheduled_to.min.should == 34
      @trek.scheduled_to.sec.should == 0
    end
  end
end
