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

    it 'generates only_time text' do
      now = Time.now
      @comment.acted_at = now
      @decorator.acted_at.should_not =~ />\d{2}:\d{2}<\/time>$/
      @decorator.acted_at(only_time: false).should_not =~ />\d{2}:\d{2}<\/time>$/
      @decorator.acted_at(only_time: true).should =~ />\d{2}:\d{2}<\/time>$/
    end
  end
end
