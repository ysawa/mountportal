require 'spec_helper'

describe "treks/index" do
  before(:each) do
    assign(:treks, [
      stub_model(Trek,
        name: "Name"
      ),
      stub_model(Trek,
        name: "Another"
      )
    ])
  end

  it "renders a list of treks" do
    render
    rendered.should have_content 'Name'
    rendered.should have_content 'Another'
  end
end
