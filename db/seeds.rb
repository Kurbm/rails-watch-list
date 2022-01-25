# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies_results = movies["results"]
movies_results.each do | movie |
  movies_title = movie["title"]
  movies_overview = movie["overview"]
  movies_poster = "https://image.tmdb.org/t/p/original#{movie["poster_path"]}"
  movies_rating = movie["vote_average"]
  Movie.update(title: movies_title, overview: movies_overview, poster_url: movies_poster, rating: movies_rating)
end
puts "finished"
