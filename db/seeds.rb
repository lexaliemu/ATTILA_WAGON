require 'json'
require 'open-uri'
key1 = 'apikey=a7b874e'
key2 = 'apikey=83c06c69'
key3 = 'apikey=249b1617'
key4 = 'apikey=d8b03b0'

puts 'Deleting all classes'
Review.destroy_all
Movie.destroy_all
User.destroy_all

puts "Create User"
alexandre = User.create!(email: "alex@attila.com" , password: "aaaaaa", username: 'Alex', avatar: 'alexAvatar.jpg', first_name: "Alexandre", last_name: "Mulliez")
william = User.create!(email: "will@attila.com" , password: "wwwwww", username: 'William', avatar: 'williamAvatar.jpeg', first_name: "William", last_name: "Segard")
alice =  User.create!(email: "alice@attila.com" , password: "aaaaaa", username: 'Alice', avatar: 'aliceAvatar.png', first_name: "Alice", last_name: "Bouffard")

puts 'Seeding IMDB movies'

list_movies1 = ['Die Hard','Harry Potter', 'Bohemian Rhapsody', 'Halloween', 'William & Kate','Rambo', 'Dikkenek','King Kong', 'Aladin', 'Bambi']
list_movies1.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key1}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_category = Category.create(name: movie_hash['Genre'])
  new_movie = Movie.create!(
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
  new_movie.remote_poster_url = movie_hash['Poster']
  new_movie.save
  new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
end

sleep(120)

list_movies2 = ['Toy Story','La verite si je mens', 'The Fall','Dumbo','Creed', 'Love Actually', 'Black Panther','Jumanji', 'The Dark knight', 'Pulp Fiction']
list_movies2.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key2}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_category = Category.create(name: movie_hash['Genre'])
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
  new_movie.remote_poster_url = movie_hash['Poster']
  new_movie.save
  new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
end

sleep(120)

list_movies3 = ['Inception', 'GoodFellas', 'The pianist', 'The departed', 'Whiplash', 'Gladiator', 'Alien', 'Django Unchained','Coco', 'Roma']
list_movies3.each do |movie|
  puts movie
  url = "http://www.omdbapi.com/?t=#{movie}&#{key3}"
  movie_serialized = open(url).read
  movie_hash = JSON.parse(movie_serialized)
  new_category = Category.create(name: movie_hash['Genre'])
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
  new_movie.remote_poster_url = movie_hash['Poster']
  new_movie.save
  new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
end

  sleep(120)

  list_movies4 = ['The Notebook', 'A Star Is Born', 'Valentine s Day', 'In Her Shoes', 'Charlies Angels', 'Vanilla Sky ', 'American Sniper', 'Spy Game','The Place Beyond the Pines']
  list_movies4.each do |movie|
    puts movie
    url = "http://www.omdbapi.com/?t=#{movie}&#{key4}"
    movie_serialized = open(url).read
    movie_hash = JSON.parse(movie_serialized)
    new_category = Category.create(name: movie_hash['Genre'])
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
    new_movie.remote_poster_url = movie_hash['Poster']
    new_movie.save
    new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
end

puts 'Seeding a review for AStarIsBorn'
first_review = Review.create(rate: 10, comment: "Exceptionnel ! Bradley est beaucoup trop sexy je suis allee le voir 4 fois", review_date: :datetime, movie: Movie.find_by(title: "A Star Is Born"), user: User.find_by(first_name: "Alice"))


