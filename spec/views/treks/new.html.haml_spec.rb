require 'spec_helper'

describe "treks/new" do
  before(:each) do
    assign(:trek, stub_model(Trek,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new trek form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", treks_path, "post" do
      assert_select "input#trek_name[name=?]", "trek[name]"
    end
  end
end
