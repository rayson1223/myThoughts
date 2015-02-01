require 'rails_helper'

RSpec.describe "thoughts/show", :type => :view do
  before(:each) do
    @thought = assign(:thought, Thought.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
