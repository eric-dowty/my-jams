require 'rails_helper'

RSpec.describe "user can create playlist" do

  context "when a user is logged in" do

    before(:each) do
      user = User.create(name: 'Eric', username: 'ed', password: 'password', password_confirmation: 'password')
      user.songs.create(title: "Yo Mama", artist: "Turing Crew")
      visit '/login'
      fill_in "session[username]", with: 'ed'
      fill_in "session[password]", with: 'password'
      click_button "Login"
    end

    it "shows a users song" do
      expect(page).to have_content("Eric's Playlist")
      expect(page).to have_content("Turing Crew")
    end

    it "lets a user add a song" do
      click_button "Add song"

      fill_in "song[title]", with: "Make the World Stop"
      fill_in "song[artist]", with: "Glitch Mob"

      click_button "Create Song"
      
      expect(page).to have_content("Eric's Playlist")
      expect(page).to have_content("Turing Crew")
      expect(page).to have_content("Make the World Stop")
      expect(page).to have_content("Glitch Mob")
    end

    it "lets a user edit a song" do
      click_button "Edit"

      fill_in "song[title]", with: "New Jam"
      fill_in "song[artist]", with: "The Who"

      click_button "Update Song" 

      expect(page).to have_content("Eric's Playlist")
      expect(page).to have_content("New Jam")
      expect(page).to have_content("The Who")
    end

    it "lets a user delete a song" do

      expect(page).to have_content("Eric's Playlist")
      expect(page).to have_content("Turing Crew")

      click_button "Delete"

      expect(page).to_not have_content("Turing Crew")      
    end

  end

  context "delete all" do

    before(:each) do
      user = User.create(name: 'Eric', username: 'ed', password: 'password', password_confirmation: 'password')
      user.songs.create(title: "Yo Mama", artist: "Turing Crew")
      user.songs.create(title: "Ya Dog", artist: "Tupac")
      user.songs.create(title: "Baby got back", artist: "Sir Mix a Lot")

      visit '/login'
      fill_in "session[username]", with: 'ed'
      fill_in "session[password]", with: 'password'
      click_button "Login"
    end

    it "lets a user delete all songs" do
      
      expect(page).to have_content("Eric's Playlist")
      expect(page).to have_content("Turing Crew")
      expect(page).to have_content("Ya Dog")
      expect(page).to have_content("Baby got back")

      click_button "Delete all"

      expect(page).to have_content("All crappy music is gone")
      expect(page).to_not have_content("Turing Crew")
      expect(page).to_not have_content("Ya Dog")
      expect(page).to_not have_content("Baby got back")
    end

  end

end

