require_relative('../db/sql_runner.rb')
class Album
attr_reader :id
attr_accessor :name, :genre, :artist_id, :id

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

  def update()
    sql = "UPDATE albums SET (genre, artist_d) = ($1, $2) WHERE id = $3"
    SqlRunner.run(sql, values)
  end


  def delete()
    sql = "DELETE FROM albums where id = $1"
    values = [@id]
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    albums_by_id = results.first
    album = Album.new(albums_by_id)
    return album
  end



end
