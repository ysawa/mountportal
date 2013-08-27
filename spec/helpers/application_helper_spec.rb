require 'spec_helper'

describe ApplicationHelper do

  describe '#make_wday_html_class' do
    it 'generates wday class symbol' do
      make_wday_html_class(nil).should be_nil
      make_wday_html_class(Time.now).should be_a Symbol
      make_wday_html_class(Time.now.to_date).should be_a Symbol
    end
  end
end
