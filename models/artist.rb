require_relative('../db/sql_runner.rb')

class Artist
  attr_reader :id
  attr_accessor :name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

def save()
 sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
 values = [@name]
 @id = SqlRunner.run(sql, values).first['id'].to_i

end

def artists_albums
  sql = "SELECT * FROM albums WHERE artist_id = $1"
  values = [@id]
  artists_albums_hash = SqlRunner.run(sql, values)
  return artists_albums_hash.map{|artist_album| Album.new(artist_album)}

end

end
