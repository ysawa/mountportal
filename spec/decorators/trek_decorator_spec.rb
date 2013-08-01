require 'spec_helper'

describe TrekDecorator do
  before :each do
    @trek = Fabricate(:trek)
    @decorator = TrekDecorator.new(@trek)
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
