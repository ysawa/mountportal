# -*- coding: utf-8 -*-

require 'spec_helper'

describe Figure do
  before :each do
    @figure = Figure.new
  end

  subject { @figure }

  describe '.new' do
    it { should_not be_persisted }
  end

  describe '.save' do
    it 'save figure successfully' do
      @figure.save.should be_true
    end
  end

  describe '.content' do
    it 'detect file type and select the best uploader' do
      sample_file = File.open(File.join(Rails.root, 'spec/fixtures/rails.png'))
      @figure.content = sample_file
      @figure.content_image?.should be_true
      @figure.content_file?.should be_false
      sample_file = File.open(File.join(Rails.root, 'Gemfile'))
      @figure.content = sample_file
      @figure.content_image?.should be_false
      @figure.content_file?.should be_true
    end
  end
end
