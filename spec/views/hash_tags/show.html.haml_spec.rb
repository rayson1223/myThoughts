require 'rails_helper'

RSpec.describe "hash_tags/show", :type => :view do
  before(:each) do
    @hash_tag = assign(:hash_tag, FactoryGirl.create(:hash_tag))
  end

  it "renders attributes in <p>" do
    render
  end
end
