user1 = User.create(name: "Minnie", username: "TuringHero", password: "password", password_confirmation: "password")
user2 = User.create(name: "Kenney", username: "boomkenster", password: "password", password_confirmation: "password")

Song.create(title: "Baby", artist: "Justin Bieber", user_id: user1.id )
Song.create(title: "Drunk in Love", artist: "Beyonce", user_id: user1.id )
Song.create(title: "Fancy", artist: "Iggy Azalea", user_id: user1.id )
Song.create(title: "Problem", artist: "Ariana Grande", user_id: user2.id )
Song.create(title: "Mo Turing, mo problems", artist: "Patrick", user_id: user2.id )

puts "Created #{Song.count} songs."