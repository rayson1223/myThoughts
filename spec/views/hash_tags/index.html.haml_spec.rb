require 'rails_helper'

RSpec.describe "hash_tags/index", :type => :view do
  before(:each) do
    assign(:hash_tags, [
      FactoryGirl.create(:hash_tag)
    ])
  end

  it "renders a list of hash_tags" do
    render
  end
end
