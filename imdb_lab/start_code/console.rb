require_relative('models/movie.rb')
require_relative('models/star.rb')
require_relative('models/casting.rb')

require('pry-byebug')

star1 = Star.new({ 'first_name' => 'Sly', 'last_name' => 'Stallone' })
star1.save()
star2 = Star.new({ 'first_name' => 'Arnie', 'last_name' => 'Schwarzenegger'})
star2.save()
# star3 = Star.new({ 'first_name' => 'Johhny', 'last_name' => 'Depp'})
# star3.save()

movie1 = Movie.new({ 'title' => 'Rocky II', 'genre' => 'Action'})
movie1.save()
movie2 = Movie.new({ 'title' => 'Rambo', 'genre' => 'Action'})
movie2.save()
movie3 = Movie.new({ 'title' => 'Terminator', 'genre' => 'Sci-Fi'})
movie3.save()
movie4 = Movie.new({ 'title' => 'Commando', 'genre' => 'Action'})
movie4.save()

casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '100000'})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star1.id, 'fee' => '80000'})
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie3.id, 'star_id' => star2.id, 'fee' => '150000'})
casting3.save()
casting4 = Casting.new({ 'movie_id' => movie4.id, 'star_id' => star2.id, 'fee' => '60000'})
casting4.save()




binding.pry
nil
