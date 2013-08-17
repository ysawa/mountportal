require 'spec_helper'

describe Comment do
  it 'can be initialized' do
    comment = Comment.new
    comment.should_not be_persisted
  end

  describe '#acted_at' do
    it 'should be a Time' do
      comment = Comment.new(content: '')
      comment.acted_at == nil
      comment.acted_at = Time.now
      comment.acted_at.should be_a Time
    end
  end

  describe '#content' do
    it 'is required' do
      comment = Comment.new(content: '')
      comment.save.should be_false
    end
  end

  describe '#fill_in_acted_at' do
    it "fills in acted_at field if its blank" do
      comment = Comment.new(acted_at: nil, content: '')
      comment.fill_in_acted_at
      comment.acted_at.should_not be_blank
    end
  end
end
