require 'rails_helper'

RSpec.describe User, :type => :model do

  describe '#new' do

    before :each do
      @user = FactoryGirl.build(:user)
    end

    it "should not be valid without an email" do
      @user.email = nil
      expect(@user.save!).to be_falsey
    end

    it "should not be valid without a username" do
      @user.username = nil
      expect(@user.save!).to be_falsey
    end

    it "should not be valid without a password" do
      @user.password = nil
      expect(@user.save!).to be_falsey
    end

  end
end
