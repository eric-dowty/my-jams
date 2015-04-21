require 'rails_helper'

RSpec.describe 'User creates a song' do 
  
  context 'with valid attributes' do
    
    before(:each) do
      user = User.create(name: 'Eric', username: 'ed', password: 'password', password_confirmation: 'password')
      user.songs.create(title: "Yo Mama", artist: "Turing Crew")
      visit '/login'
      fill_in "session[username]", with: 'ed'
      fill_in "session[password]", with: 'password'
      click_button "Login"
    end

    it 'saves and displays title and artist' do
      click_button "Add song"
      fill_in "song[title]", with: "My Song"
      fill_in "song[artist]", with: "An Artist"
      click_link_or_button "Create Song"
      expect(page).to have_content('My Song')
      expect(page).to have_content('An Artist')
    end
  end
end