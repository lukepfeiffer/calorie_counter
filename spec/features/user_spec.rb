require 'spec_helper'

RSpec.describe "Users", type: :request do
  context "User Activities" do
    let(:user) { Fabricate(:user) }

    it "allows user to sign in" do
      visit "/"
      fill_in "user_email", with: "email@example.com"
      fill_in "user_password", with: "password"
      click_button "Sign In"
      expect(page.body).to include("Sign in successful!")
    end

    it "allows user to sign up" do
      visit "/"
      fill_in "user_email", with: "newuser@example.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      fill_in "user_first_name", with: "Joe"
      fill_in "user_last_name", with: "Smith"
      fill_in "user_age", with: "20"
      click_button "Sign Up"
      expect(page.body).to include("Sign up successful!")
    end

    it "allows user to edit information" do
      sign_in(user)
      visit "/users/#{user.id}"
      fill_in "user_email", with: "newemail@example.com"
      expect(user.email).to eq("newemail@example.com")
    end

    it "allows user to sign out" do
      click_link "Sign out"
      expect(page.body).to include("Sign out successful")
    end

    def sign_in(user)
        visit "/"
        fill_in "user_email", with: user.email
        fill_in "user_password", with: "password" # The default users password is always password!
        click_button "Sign In"
    end

  end
end
