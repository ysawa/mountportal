require 'spec_helper'

describe "treks/edit" do
  before(:each) do
    @trek = assign(:trek, stub_model(Trek,
      :name => "MyString"
    ))
  end

  it "renders the edit trek form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trek_path(@trek), "post" do
      assert_select "input#trek_name[name=?]", "trek[name]"
    end
  end
end
