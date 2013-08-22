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

  describe '#build_data' do
    it 'builds hash data of image for user' do
      sample_file = File.open(File.join(Rails.root, 'spec/fixtures/rails.png'))
      @figure.content = sample_file
      data = @figure.build_data
      data['id'].should == @figure.id.to_s
      data['image_url'].should be_present
      data['image_url'].should == @figure.image.url
      data['small_image_url'].should be_present
      data['small_image_url'].should == @figure.image.small.url
      data['thumb_image_url'].should be_present
      data['thumb_image_url'].should == @figure.image.thumb.url
      data['caption'].should include 'rails.png'
    end

    it 'builds hash data of image for user' do
      sample_file = File.open(File.join(Rails.root, 'Gemfile'))
      @figure.content = sample_file
      data = @figure.build_data
      data['id'].should == @figure.id.to_s
      data['file_url'].should be_present
      data['file_url'].should == @figure.file.url
      data['caption'].should include 'Gemfile'
    end
  end

  describe '#save' do
    it 'save figure successfully' do
      @figure.save.should be_true
    end
  end

  describe '#content' do
    it 'detect file type as image and select the best uploader' do
      sample_file = File.open(File.join(Rails.root, 'spec/fixtures/rails.png'))
      @figure.content = sample_file
      @figure.content_image?.should be_true
      @figure.content_file?.should be_false
      @figure.caption.should include 'rails.png'
      @figure.caption = nil
    end

    it 'detect file type as file and select the best uploader' do
      sample_file = File.open(File.join(Rails.root, 'Gemfile'))
      @figure.content = sample_file
      @figure.content_image?.should be_false
      @figure.content_file?.should be_true
      @figure.caption.should include 'Gemfile'
    end
  end
end
