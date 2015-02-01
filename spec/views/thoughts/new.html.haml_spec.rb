require 'rails_helper'

RSpec.describe "thoughts/new", :type => :view do
  before(:each) do
    assign(:thought, Thought.new())
  end

  it "renders new thought form" do
    render

    assert_select "form[action=?][method=?]", thoughts_path, "post" do
    end
  end
end
