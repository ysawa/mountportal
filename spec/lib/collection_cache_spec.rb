require 'spec_helper'

describe CollectionCache do

  before :each do
    @comments = []
    @comments << Fabricate(:comment, content: 'comment 1')
    @comments << Fabricate(:comment, content: 'comment 2')
    @comments << Fabricate(:comment, content: 'comment 3')
    @comments << Fabricate(:comment, content: 'comment 4')
  end

  it 'can be initialized' do
    @cache = CollectionCache.new(Comment)
    @cache.collection.should == []
    @cache.klass.should == Comment
  end

  describe '#find' do
    before :each do
      @cache = CollectionCache.new(Comment, @comments.first)
    end

    it 'finds the object from collection' do
      @cache.find(@comments.first.id).should == @comments.first
      @cache.find(@comments.first.id.to_s).should == @comments.first
      @cache.find(@comments.first).should == @comments.first
    end

    it 'finds the object out of collection' do
      @cache.find(@comments[1].id).should == @comments[1]
      @cache.find(@comments[2].id.to_s).should == @comments[2]
      @cache.find(@comments[3]).should == @comments[3]
    end

    it 'pushes the finding object into collection' do
      @cache.find(@comments[1].id)
      @cache.collection.should include @comments[1]
      @cache.collection.should_not include @comments[2]
    end
  end
end
