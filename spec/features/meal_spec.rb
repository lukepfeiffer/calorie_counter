require 'spec_helper'

RSpec.describe "Meals", type: :request do
  context "Meals activities" do
    before(:each) do
      @user = User.create(first_name: "name", last_name: "name", password: "password", email: "new@example.com", age: "20")
    end

    it "allows users to create meals" do
      sign_in(@user)
      select "Breakfast", from: "meal_name"
      fill_in "food_serving_size", with: "16"
      fill_in "food_calorie_count", with: "200"
      fill_in "food_name", with: "Eggs"
    end

    it "display all meals for the day" do
      sign_in(@user)
      expect(page.body).to include("Breakfast")
      expect(page.body).to include("Eggs")
      expect(page.body).to include("200")
    end

    def sign_in(user)
      visit "/"
      fill_in "sign_in_email", with: "new@example.com"
      fill_in "sign_in_password", with: "password"
      click_button "Sign In"
    end
  end
end
