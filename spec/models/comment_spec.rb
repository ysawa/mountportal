require 'spec_helper'

describe Comment do
  it 'can be initialized' do
    comment = Comment.new
    comment.should_not be_persisted
  end

  describe '#content' do
    it 'is required' do
      comment = Comment.new(content: '')
      comment.save.should be_false
    end
  end

  describe '#acted_at' do
    it 'should be a Time' do
      comment = Comment.new(content: '')
      comment.acted_at == nil
      comment.acted_at = Time.now
      comment.acted_at.should be_a Time
    end
  end
end
