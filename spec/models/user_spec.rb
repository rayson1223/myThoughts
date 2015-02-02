require 'rails_helper'

RSpec.describe User, :type => :model do

  describe '#new' do

    before :each do
      @user = FactoryGirl.build(:user)
    end

    it "has a valid factory" do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it "should not be valid without an email" do
      expect(FactoryGirl.build(:user, {username: "tester", email: nil, password: "123123123", password_confirmation: "123123123"})).to be_invalid
    end

    it "should not be valid without a username" do
      expect(FactoryGirl.build(:user, {username: nil, email: "test@test.com", password: "123123123", password_confirmation: "123123123"})).to be_invalid
    end

    it "should not be valid without a password" do
      expect(FactoryGirl.build(:user, {username: "tester", email: "test@test.com", password: nil, password_confirmation: "123123123"})).to be_invalid
    end

  end
end
