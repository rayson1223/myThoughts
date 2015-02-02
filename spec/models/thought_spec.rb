require 'rails_helper'

RSpec.describe Thought, :type => :model do
  context "Thoughts#New" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:thought)).to be_valid
    end

    it "invalid without user" do
      expect(FactoryGirl.build(:thought, user_id: nil)).to be_invalid
    end

    it "invalid without user" do
      user = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:thought, {user_id: user.id, content: nil })).to be_invalid
    end
    # it "Should increment count by 1" do
    #   count = Thought.all.length
    #   t1 = FactoryGirl.create(:thought)

    #   expect{Thought.count}.to change{Thought.count}.from(count).to(Thought.count)
    # end
  end
end
