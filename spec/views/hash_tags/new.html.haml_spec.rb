require 'rails_helper'

RSpec.describe "hash_tags/new", :type => :view do
  before(:each) do
    assign(:hash_tag, HashTag.new())
  end

  it "renders new hash_tag form" do
    render

    assert_select "form[action=?][method=?]", hash_tags_path, "post" do
    end
  end
end
