require 'spec_helper'

RSpec.describe "Devise Authentication: ", :type => :request do

    subject { page }

    describe "Signup page" do
        before { visit new_user_registration_path }

        let(:submit) { "Create my account" }

        describe "with invalid information" do
          it "should not create a user" do
            expect { click_button submit }.not_to change(User, :count)
          end

          describe "after submission" do
            before { click_button submit }

            it { should have_content('Sign up') }
            it { should have_content('error') }
          end
        end

        describe "with valid information" do
          before do
            fill_in "username",                 with: "exampleguy"
            fill_in "email",                    with: "user@example.com"
            fill_in "password",                 with: "foobar1234"
            fill_in "password_confirmation",    with: "foobar1234"
          end

          it "should create a user" do
            expect { click_button submit }.to change(User, :count).by(1)
          end

          #describe "after saving the user" do
            #before { click_button submit }
            #let(:user) { User.find_by(email: 'user@example.com') }

            #it { should have_title(user.first_name) }
            #it { should have_selector('div.flash_success', text: 'Welcome') }
         # end
        end

        it { should have_content('Sign up') }
    end


    describe "Signin page" do

        before { visit new_user_session_path }

        describe "with invalid information" do
            before { click_button "Sign in" }

            it { should have_content('Sign in') }
            it { should have_selector('div.flash_alert', text: "Invalid") }

        end

        describe "with valid information" do
            let(:user) { FactoryGirl.create(:user) }
            before do
                fill_in "login",    with: user.email
                fill_in "password", with: user.password
                click_button "Sign in"
            end

            it { should_not have_selector('a', text: 'Sign up')}
            it { should_not have_selector('a', text: 'Sign in')}
            it { should have_selector('a', text: 'Profile') }
            it { should have_selector('a', text: 'Sign Out') }
            it { should have_selector('div.flash_notice', text: "Signed in successfully.") }

        end

        it { should have_content('Sign in') }
    end
end
