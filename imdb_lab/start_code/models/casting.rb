require_relative("../db/sql_runner")

class Casting

attr_reader :id
attr_accessor :movie_id, :star_id, :fee


  def initialize (options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i
  end

  def save()
    sql = "INSERT INTO castings
    (
      movie_id, star_id, fee
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run( sql, values ).first
    @id = casting['id'].to_i
  end

  def update()
    sql = "UPDATE castings
    SET
      movie_id = $1, star_id = $2, fee = $3
    WHERE id = $4"
    values = [@movie_id, @star_id, @fee]
    update = SqlRunner.run( sql, values ).first
    @id = update['id'].to_i
  end

  def stars()
    sql = "SELECT stars.*
          FROM stars
          INNER JOIN movies
          ON movies.star_id = stars.id
          WHERE movies.star_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    result = stars.map {|star| Star.new(star)}
    return result
  end

  def self.all()
  sql = "SELECT * FROM castings"
  values = []
  castings = SqlRunner.run(sql, values)
  result = castings.map { |casting| Casting.new( casting ) }
  return result
end

def self.delete_all()
  sql = "DELETE FROM castings"
  values = []
  SqlRunner.run(sql, values)
end

end
