require 'json'
require 'open-uri'
require 'faker'
require 'date'
key1 = 'apikey=a7b874e'
key2 = 'apikey=83c06c69'
key3 = 'apikey=249b1617'
key4 = 'apikey=d8b03b0'

puts 'Deleting all classes'
Order.destroy_all
WatchlistItem.destroy_all
FollowedPlaylist.destroy_all
MoviePlaylist.destroy_all
Playlist.destroy_all
Review.destroy_all
Movie.destroy_all
User.destroy_all
Playlist.destroy_all

puts "Create User"

alexandre = User.create!(email: "alex@attila.com" , password: "aaaaaa", username: 'Alex', first_name: "Alexandre", last_name: "Mulliez")
william = User.create!(email: "will@attila.com" , password: "wwwwww", username: 'William', first_name: "William", last_name: "Segard")
alice =  User.create!(email: "alice@attila.com" , password: "aaaaaa", username: 'Alice', first_name: "Alice", last_name: "Bouffard")
brad = User.create!(email: "brad@attila.com" , password: "aaaaaa", username: 'Bradley Cooper', first_name: "Bradley", last_name: "Cooper")
leo = User.create!(email: "leo@attila.com" , password: "wwwwww", username: 'Leonardo Dicaprio', first_name: "Leonardo", last_name: "Dicaprio")
mart = User.create!(email: "mart@attila.com" , password: "wwwwww", username: 'Martin Scorsese', first_name: "Martin", last_name: "Scorsese")
sylvester = User.create!(email: "sylvester@attila.com" , password: "wwwwww", username: 'Sylvester Stallone', first_name: "Sylvester", last_name: "Stallone")
quentin = User.create!(email: "quentin@attila.com" , password: "wwwwww", username: 'Quentin Tarantino', first_name: "Quentin", last_name: "Tarantino")
cameron = User.create!(email: "cameron@attila.com" , password: "wwwwww", username: 'Cameron Diaz', first_name: "Cameron", last_name: "Diaz")
ginger = User.create!(email: "ginger@attila.com" , password: "wwwwww", username: 'Ginger Dog', first_name: "Ginger", last_name: "Dog")
jamie = User.create!(email: "jamie@attila.com" , password: "wwwwww", username: 'Jamie Foxx', first_name: "Jamie", last_name: "Foxx")
tom = User.create!(email: "tomc@attila.com" , password: "wwwwww", username: 'Tom Cruise', first_name: "Tom", last_name: "Cruise")
arnold = User.create!(email: "anorld@attila.com" , password: "wwwwww", username: 'Arnold Schwarzenegger', first_name: "Arnold", last_name: "Schwarzenegger")
donald = User.create!(email: "donald@attila.com" , password: "wwwwww", username: 'Donald Trump', first_name: "Donald", last_name: "Trump")
guigui = User.create!(email: "guillaume@attila.com" , password: "wwwwww", username: 'Guillaume Canet', first_name: "Guillaume", last_name: "Canet")
marion = User.create!(email: "marion@attila.com" , password: "wwwwww", username: 'Marion Cotillard', first_name: "Marion", last_name: "Cotillard")
new_users = [alexandre, william, alice, brad, leo, mart, sylvester, quentin, cameron, ginger, jamie, tom, arnold, donald, guigui, marion]
avatar_urls = ["https://res.cloudinary.com/dvtjorjay/image/upload/v1544285805/alexAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1543573506/williamAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544285867/aliceAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544285972/bradleyAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544286075/LeonardoAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544286241/MartinAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544286401/sylvesterAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544286639/tarantinoAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544286783/cameronAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1543530833/iwopilwirvu8kft7b0ez.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544287996/jamieAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544288151/tomAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544288389/arnoldAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544288510/donaldAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544625065/guillaumeAvatar.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544625181/marionAvatar.jpg"
             ]

new_users.each_with_index do |x,index|
  x.remote_avatar_url = avatar_urls[index]
  x.save
end
# 20.times do
#   new_user = User.create!(
#     email: "@attila.com",
#     password: "aaaaaa",
#     username: Faker::Cat.name,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#   })
#   new_user.remote_avatar_url = avatar_urls.sample
#   new_user.save
#   puts "ok"
# end

playlist_urls =["https://res.cloudinary.com/dvtjorjay/image/upload/v1544290710/playlist1.png",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544290741/playlist2.png",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544290778/playlist3.png",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544290830/playlist4.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544290855/playlist5.png"
]

puts 'Seeding playlists'
40.times do
  new_playlist = Playlist.create(
  {
    name: Faker::Community.characters,
    description:Faker::Community.quotes,
    playlist_date: Date.today,
    user: new_users.sample
  })
  new_playlist.remote_picture_url = playlist_urls.sample
  new_playlist.save!
end

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
      rating: movie_hash['imdbRating'].to_i.fdiv(2),
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
      rating: movie_hash['imdbRating'].to_i.fdiv(2),
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
      rating: movie_hash['imdbRating'].to_i.fdiv(2),
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
        rating: movie_hash['imdbRating'].to_i.fdiv(2),
        price: [3, 4, 5].sample,
        trailer_url: "http://m.imdb.com/title/#{movie_hash['imdbID']}/videogallery",
        number_rates: movie_hash['imdbVotes'],
      })
    new_movie.remote_poster_url = movie_hash['Poster']
    new_movie.save
    new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
end

puts 'Seeding a review for AStarIsBorn'
first_review = Review.create(rate: 4, comment: "Exceptionnel ! Bradley est beaucoup trop sexy je suis allee le voir 4 fois", review_date: :datetime, movie: Movie.find_by(title: "A Star Is Born"), user: User.find_by(first_name: "Alice"))


Movie.index

