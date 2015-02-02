require 'rails_helper'

RSpec.describe "thoughts/edit", :type => :view do
  before(:each) do
    @thought = assign(:thought, FactoryGirl.create(:thought))
  end

  it "renders the edit thought form" do
    render

    assert_select "form[action=?][method=?]", thought_path(@thought), "post" do
    end
  end
end
