require 'spec_helper'

describe TrekDecorator do
  before :each do
    @trek = Fabricate(:trek)
    @decorator = TrekDecorator.new(@trek)
  end

  describe '#picture' do

    it 'generates noimage picture' do
      @trek.picture = nil
      @decorator.picture.should include 'trek.png'
    end

    it 'generates figure image' do
      @figure = Fabricate(:image_figure)
      @trek.picture = @figure
      @decorator.picture.should include @figure.image.thumb.url
    end
  end

  describe '#published' do
    it 'generates text whether trek is published' do
      @trek.published = true
      @decorator.published.should include I18n.t('statuses.published')
      @trek.published = false
      @decorator.published.should include I18n.t('statuses.unpublished')
    end
  end
end
