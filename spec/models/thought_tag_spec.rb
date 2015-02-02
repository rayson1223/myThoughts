require 'rails_helper'

RSpec.describe ThoughtTag, :type => :model do
  describe '#new' do

    it "has a valid factory" do
      expect(FactoryGirl.create(:thought_tag)).to be_valid
    end

    it "should not be valid without hash_tag_id" do
      expect(FactoryGirl.build(:thought_tag, {thought_id: 1, hash_tag_id: nil})).to be_invalid
    end

    it "should not be valid without thought_id" do
      expect(FactoryGirl.build(:thought_tag, {thought_id: nil, hash_tag_id: 1})).to be_invalid
    end

  end
end
