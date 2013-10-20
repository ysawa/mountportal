require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @trek = assign(:trek, Fabricate(:trek))
    user_sign_in
  end

  it "renders the new comment form" do
    @comment = assign(:comment, Fabricate.build(:comment, trek: @trek))
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "put" do
      assert_select "input#comment_content[name=?]", "comment[content]"
    end
  end

  it "renders the edit comment form" do
    @comment = assign(:comment, Fabricate(:comment, trek: @trek))
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "put" do
      assert_select "input#comment_content[name=?]", "comment[content]"
    end
  end
end
