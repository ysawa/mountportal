require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @trek = assign(:trek, Fabricate(:trek))
    @comment = assign(:comment, stub_model(Comment,
      :content => "MyString"
    ))
    user_sign_in
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input#comment_content[name=?]", "comment[content]"
    end
  end
end