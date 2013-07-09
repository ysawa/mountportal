require 'spec_helper'

describe PagesHelper do

  describe '#make_page_title' do
    it 'generates translated title from controller path and action name' do
      make_page_title('home', 'index').should == 'トップページ'
      make_page_title('about', 'tos').should == '利用規約'
    end
  end
end
