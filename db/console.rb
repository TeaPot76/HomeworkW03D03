require_relative('../models/album.rb')
require_relative('../models/artist.rb')


artist1 = Artist.new({'name' => 'Black Sabbath'})
artist1.save

artist2 = Artist.new({'name'=> 'Slayer'})
artist2.save
album1 = Album.new({'name'=> 'Sabbath Bloody Sabbath', 'genre' => 'Heavy metal(doomy)','artist_id' => artist1.id})
album1.save

album2 = Album.new({'name'=> 'Paranoid', 'genre' => 'Heavy metal(doomy)','artist_id' => artist1.id})
album2.save

album3 = Album.new({'name'=> 'Heaven and Hell', 'genre' => 'Heavy metal(doomy)','artist_id' => artist1.id})
album3.save


album4 = Album.new({'name'=> 'Raining Blood', 'genre' => 'Thrash metal','artist_id' => artist2.id})
album4.save

# p artist2.artists_albums

p album4.artist

# p Album.find()
