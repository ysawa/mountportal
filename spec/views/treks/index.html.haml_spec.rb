require 'spec_helper'

describe "treks/index" do
  before(:each) do
    assign(:treks, [
      stub_model(Trek,
        :name => "Name"
      ),
      stub_model(Trek,
        :name => "Name"
      )
    ])
  end

  it "renders a list of treks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
