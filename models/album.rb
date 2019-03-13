class Album
attr_reader :id
attr_accessor :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
   sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1, $2, $3) RETURNING *"
   values = [@name, @genre, @artist_id]
   @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def artist
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]
    artist_hash = SqlRunner.run(sql, values)
    return artist_hash.map{|artist| Artist.new(artist)}
  end
  #
  # def artists_albums
  #   sql = "SELECT * FROM albums WHERE artist_id = $1"
  #   values = [@id]
  #   artists_albums_hash = SqlRunner.run(sql, values)
  #   return artists_albums_hash.map{|artist_album| Album.new(artist_album)}
  #
  # end
  # def self.find(id)
  #   sql = "SELECT * FROM albums WHERE artist_id = $1"
  #   values =[id]
  #   albums = SqlRunner.run(sql, values)
  #   albums_by_artist = albums.first
  #   list_all_albums = Album.new(albums_by_artist)
  #   return list_all_albums
  # end

end
