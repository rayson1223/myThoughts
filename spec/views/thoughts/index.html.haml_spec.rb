require 'rails_helper'

RSpec.describe "thoughts/index", :type => :view do
  before(:each) do
    assign(:thoughts, [
      Thought.create!(),
      Thought.create!()
    ])
  end

  it "renders a list of thoughts" do
    render
  end
end
