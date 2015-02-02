require 'rails_helper'

RSpec.describe HashTag, :type => :model do
  describe '#new' do

    it "has a valid factory" do
      expect(FactoryGirl.create(:hash_tag)).to be_valid
    end

    it "should not be valid without an hash_tag" do
      expect(FactoryGirl.build(:hash_tag, hash_tag: nil)).to be_invalid
    end

  end
end
