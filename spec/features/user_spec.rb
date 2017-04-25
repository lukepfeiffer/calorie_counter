require 'spec_helper'

RSpec.describe "Users", type: :request do
  context "User Activities" do

    before(:each) do
      @user = User.create(first_name: "name", last_name: "name", password: "password", email: "new@example.com", age: "20")
    end

    it "allows user to sign in" do
      visit "/"
      fill_in "sign_in_email", with: "new@example.com"
      fill_in "sign_in_password", with: "password"
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

    it "displays error message on invalid credentials" do
      visit "/"
      click_button "Sign In"
      expect(page.body).to include("Email or password did not match")
    end

    it "allows user to edit information" do
      sign_in(@user)
      visit "/users/#{@user.id}/edit"
      fill_in "user_email", with: "newemail@example.com"
      click_button "Update"
      expect(page.body).to include("Update was successful!")
    end

    it "allows user to sign out" do
      sign_in(@user)
      click_link "Sign out"
      expect(page.body).to include("Sign out successful!")
    end

    it "authenticates users" do
      visit "/users/#{@user.id}/edit"
      expect(page.body).to include("Invalid credentials")
      expect(current_path).to eq("/")
    end

    def sign_in(user)
      visit "/"
      fill_in "sign_in_email", with: "new@example.com"
      fill_in "sign_in_password", with: "password"
      click_button "Sign In"
    end

  end
end
