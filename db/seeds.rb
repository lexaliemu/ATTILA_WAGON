require 'json'
require 'open-uri'
key1 = 'apikey=a7b874e'
key2 = 'apikey=83c06c69'
key3 = 'apikey=249b1617'
# keyalex = 'apikey=d8b03b0'

puts 'Deleting all movies'
Review.destroy_all
Movie.destroy_all
User.destroy_all
Category.destroy_all
FollowedPlaylist.destroy_all
MovieCategory.destroy_all
MoviePlaylist.destroy_all
Playlist.destroy_all
Watchlist.destroy_all
WatchlistItem.destroy_all

puts "Create User"
alexandre = User.create!(email: "alex@attila.com" , password: "aaaaaa", username: 'Alex', avatar: 'alexAvatar.jpg')
william = User.create!(email: "will@attila.com" , password: "wwwwww", username: 'William', avatar: 'williamAvatar.jpeg')
alice =  User.create!(email: "alice@attila.com" , password: "aaaaaa", username: 'Alice', avatar: 'aliceAvatar.png')

puts 'Seeding IMDB movies'

list_movies1 = ['Die Hard','Harry Potter', 'Bohemian Rhapsody', 'Halloween', 'William & Kate','Rambo', 'Dikkenek','King Kong', 'Aladin', 'Bambi']
list_movies1.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key1}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_movie = Movie.create(
    {
      title: movie_hash['Title'],
      director: movie_hash['Director'],
      release_date: movie_hash['Year'],
      syllabus: movie_hash['Plot'],
      duration: movie_hash['Runtime'],
      actors: movie_hash['Actors'],
      movie_url: "https://www.imdb.com/title/#{movie_hash['imdbID']}/",
      rating: movie_hash['imdbRating'],
      price: [3, 4, 5].sample,
      trailer_url: "http://m.imdb.com/title/#{movie_hash['imdbID']}/videogallery",
      number_rates: movie_hash['imdbVotes'],
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end

sleep(120)

list_movies2 = ['Toy Story','La verite si je mens', 'The Fall','Dumbo','Creed', 'Love Actually', 'Black Panther','Jumanji', 'The Dark knight', 'Pulp Fiction']
list_movies2.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key2}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_movie = Movie.create(
    {
      title: movie_hash['Title'],
      release_date: movie_hash['Year'],
      duration: movie_hash['Runtime'],
      description: movie_hash['Plot'],
      category: movie_hash['Genre'],
      director: movie_hash['Director'],
      price: [3, 4, 5].sample,
      rating: movie_hash['imdbRating'],
      nb_rates: 1 + rand(9),
      user: alexandre
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end

sleep(120)

list_movies3 = ['Inception', 'GoodFellas', 'The pianist', 'The departed', 'Whiplash', 'Gladiator', 'Alien', 'Django Unchained','Coco']
list_movies3.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key3}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_movie = Movie.create(
    {
      title: movie_hash['Title'],
      release_date: movie_hash['Year'],
      duration: movie_hash['Runtime'],
      description: movie_hash['Plot'],
      category: movie_hash['Genre'],
      director: movie_hash['Director'],
      price: [3, 4, 5].sample,
      rating: movie_hash['imdbRating'],
      nb_rates: 1 + rand(9),
      user: william
    })
  new_movie.remote_cover_url = movie_hash['Poster']
  new_movie.save
end
