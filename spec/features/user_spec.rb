require 'rails_helper'

RSpec.describe "user account stuff" do

  context "user creates account with valid attributes" do

    it "creates an account" do
      visit new_user_path

      fill_in "user[name]", with: "eric"
      fill_in "user[username]", with: 'ed'
      fill_in "user[password]", with: 'password'
      fill_in "user[password_confirmation]", with: 'password'

      click_button "Create Account"

      expect(page).to have_content("Welcome eric")
    end

  end

  context "will not create an account with invalid attributes" do

    it "does not create an account without a name" do
      visit new_user_path

      fill_in "user[username]", with: 'ed'
      fill_in "user[password]", with: 'password'
      fill_in "user[password_confirmation]", with: 'password'

      click_button "Create Account"

      expect(page).to have_content("Name can't be blank")
    end

    it "does not create an account without a username" do
      visit new_user_path

      fill_in "user[name]", with: "eric"
      fill_in "user[password]", with: 'password'
      fill_in "user[password_confirmation]", with: 'password'

      click_button "Create Account"

      expect(page).to have_content("Username can't be blank")
    end

    it "does not create an account without a password" do
      visit new_user_path

      fill_in "user[name]", with: "eric"
      fill_in "user[username]", with: 'ed'
      fill_in "user[password_confirmation]", with: 'password'

      click_button "Create Account"

      expect(page).to have_content("Password can't be blank")
    end

    it "does not create an account without a password confirmation" do
      visit new_user_path

      fill_in "user[name]", with: "eric"
      fill_in "user[username]", with: 'ed'
      fill_in "user[password]", with: 'password'

      click_button "Create Account"

      expect(page).to have_content("Password confirmation doesn't match Password")
    end


  end

end