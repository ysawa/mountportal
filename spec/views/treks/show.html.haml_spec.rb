require 'spec_helper'

describe "treks/show" do
  before(:each) do
    @trek = assign(:trek, stub_model(Trek,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
