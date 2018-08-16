require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget - options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO movies
    (
      title, genre
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def update()
    sql = "UPDATE movies
    SET
    title = $1, genre = $2, budget = $3
    WHERE id = $4"
    values = [@title, @genre, @budget]
    update = SqlRunner.run( sql, values ).first
    @id = update['id'].to_i
  end

  # def star()
  #   sql = "SELECT * FROM stars WHERE id = $1"
  #   values = [@user_id]
  #   star = SqlRunner.run(sql, values).first
  #   return User.new(star)
  # end

  # display all the stars for a particular movie

  def stars()
    sql = "SELECT stars.* FROM stars INNER JOIN
    castings ON stars.id = castings.star_id
    WHERE movie_id = $1"
    values = [@id]
    star_data = SqlRunner.run(sql, values)
    return Star.map_items(star_data)#see self.map below
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    result = movies.map { |movie| Movie.new( movie ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.map_items(data)
    result = data.map{|movie| Movie.new(movie)}
    return result
  end

end
