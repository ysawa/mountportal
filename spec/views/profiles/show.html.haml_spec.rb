require 'spec_helper'

describe "profiles/show.html.haml" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "User Name"
    ))
  end

  it "renders attributes" do
    render
    rendered.should match(/User Name/)
  end
end
