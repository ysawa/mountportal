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
end
