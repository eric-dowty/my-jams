require 'rails_helper'

RSpec.describe "user sessions" do

  context "user login with valid credentials" do

    before(:each) do 
      User.create(name: "eric", username: "ed", password: "password", password_confirmation: "password")
      visit login_path
    end

    it "lets a user login" do
      fill_in "session[username]", with: "ed"
      fill_in "session[password]", with: "password"

      click_button "Login"

      expect(page).to have_content("Welcome eric")
    end

    it "does not let the user login with no username" do
      fill_in "session[password]", with: "password"

      click_button "Login"

      expect(page).to have_content("Invalid login")
    end

    it "does not let the user login with no password" do
      fill_in "session[username]", with: "ed"

      click_button "Login"

      expect(page).to have_content("Invalid login")
    end

    it "does not let the user login with bad password" do
      fill_in "session[username]", with: "ed"
      fill_in "session[password]", with: "no"

      click_button "Login"

      expect(page).to have_content("Invalid login")
    end

    it "does not let the user login wiht bad username" do
      fill_in "session[username]", with: "no"
      fill_in "session[password]", with: "password"

      click_button "Login"

      expect(page).to have_content("Invalid login")
    end

  end

  context "user can logout after logging in" do

    before(:each) do 
      User.create(name: "eric", username: "ed", password: "password", password_confirmation: "password")
      visit login_path
      fill_in "session[username]", with: "ed"
      fill_in "session[password]", with: "password"
      click_button "Login"
    end

    it "lets a user logout" do 
      click_button "Logout"
      expect(page).to have_content("Successful logout")
    end

  end

end