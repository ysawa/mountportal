require 'spec_helper'

describe CommentDecorator do
  before :each do
    @comment = Fabricate(:comment)
    @decorator = CommentDecorator.new(@comment)
  end

  describe '#acted_at' do
    it 'generates text of acted_at' do
      @comment.acted_at = nil
      @decorator.acted_at.should be_blank
      now = Time.now
      @comment.acted_at = now
      @decorator.acted_at.should_not be_blank
    end
  end
end
