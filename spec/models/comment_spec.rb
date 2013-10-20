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

  describe '#children' do
    before :each do
      @comment = Fabricate(:comment)
      @parent_comment = Fabricate(:comment)
    end

    it 'finds the children of the comment' do
      @comment.children.to_a.should == []
      @parent_comment.children.to_a.should == []
      @comment.parent = @parent_comment
      @comment.save
      @comment.children.to_a.should == []
      @parent_comment.children.to_a.should == [@comment]
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

  describe '#parent' do
    before :each do
      @comment = Fabricate(:comment)
      @parent_comment = Fabricate(:comment)
    end

    it 'finds the parent of the comment' do
      @comment.parent.should be_nil
      @parent_comment.parent.should be_nil
      @comment.parent = @parent_comment
      @comment.parent.should == @parent_comment
      @parent_comment.parent.should be_nil
    end
  end
end
