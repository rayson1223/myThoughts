require 'rails_helper'

RSpec.describe "hash_tags/edit", :type => :view do
  before(:each) do
    @hash_tag = assign(:hash_tag, HashTag.create!())
  end

  it "renders the edit hash_tag form" do
    render

    assert_select "form[action=?][method=?]", hash_tag_path(@hash_tag), "post" do
    end
  end
end
