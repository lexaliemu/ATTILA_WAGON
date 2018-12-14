require 'json'
require 'open-uri'
require 'faker'
require 'date'
key1 = 'apikey=a7b874e'
key2 = 'apikey=83c06c69'
key3 = 'apikey=249b1617'
key4 = 'apikey=d8b03b0'


Order.destroy_all
WatchlistItem.destroy_all
FollowedPlaylist.destroy_all
MoviePlaylist.destroy_all
Playlist.destroy_all
Review.destroy_all
User.destroy_all
Playlist.destroy_all

puts "Create User"

alexandre = User.create!(email: "alex@attila.com" , password: "aaaaaa", username: 'Alex', first_name: "Alexandre", last_name: "Mulliez")
william = User.create!(email: "will@attila.com" , password: "wwwwww", username: 'William', first_name: "William", last_name: "Segard")
eric = User.create!(email: "eric@attila.com" , password: "eeeeee", username: 'Eric', first_name: "Eric", last_name: "Toledano")
gilles = User.create!(email: "gilles@attila.com" , password: "gggggg", username: 'Gilles', first_name: "Gilles", last_name: "Lellouche")
jean = User.create!(email: "jean@attila.com" , password: "jjjjjj", username: 'Jean', first_name: "Jean", last_name: "Dujardin")
leila = User.create!(email: "leila@attila.com" , password: "llllll", username: 'Leila', first_name: "Leila", last_name: "Bekhti")
alice =  User.create!(email: "alice@attila.com" , password: "aaaaaa", username: 'Alice', first_name: "Alice", last_name: "Bouffard")
victoria =  User.create!(email: "victoria@attila.com" , password: "vvvvvv", username: 'Victoria', first_name: "Victoria", last_name: "Bouffard")
brad = User.create!(email: "brad@attila.com" , password: "bbbbbb", username: 'Bradley Cooper', first_name: "Bradley", last_name: "Cooper")
leo = User.create!(email: "leo@attila.com" , password: "llllll", username: 'Leonardo Dicaprio', first_name: "Leonardo", last_name: "Dicaprio")
mart = User.create!(email: "mart@attila.com" , password: "mmmmmm", username: 'Martin Scorsese', first_name: "Martin", last_name: "Scorsese")
sylvester = User.create!(email: "sylvester@attila.com" , password: "ssssss", username: 'Sylvester Stallone', first_name: "Sylvester", last_name: "Stallone")
quentin = User.create!(email: "quentin@attila.com" , password: "qqqqqq", username: 'Quentin Tarantino', first_name: "Quentin", last_name: "Tarantino")
cameron = User.create!(email: "cameron@attila.com" , password: "cccccc", username: 'Cameron Diaz', first_name: "Cameron", last_name: "Diaz")
jamie = User.create!(email: "jamie@attila.com" , password: "jjjjjj", username: 'Jamie Foxx', first_name: "Jamie", last_name: "Foxx")
tom = User.create!(email: "tomc@attila.com" , password: "tttttt", username: 'Tom Cruise', first_name: "Tom", last_name: "Cruise")
arnold = User.create!(email: "anorld@attila.com" , password: "aaaaaa", username: 'Arnold Schwarzenegger', first_name: "Arnold", last_name: "Schwarzenegger")
donald = User.create!(email: "donald@attila.com" , password: "dddddd", username: 'Donald Trump', first_name: "Donald", last_name: "Trump")
guigui = User.create!(email: "guillaume@attila.com" , password: "gggggg", username: 'Guillaume Canet', first_name: "Guillaume", last_name: "Canet")
marion = User.create!(email: "marion@attila.com" , password: "mmmmmm", username: 'Marion Cotillard', first_name: "Marion", last_name: "Cotillard")
simon = User.create!(email: "simon@attila.com" , password: "ssssss", username: 'Simon Istolainen', first_name: "Simon", last_name: "Istolainen")
new_users = [alexandre, william, eric, gilles, jean, leila, alice, victoria, brad, leo, mart, sylvester, quentin, cameron, jamie, tom, arnold, donald, guigui, marion, simon]
avatar_urls = ["https://res.cloudinary.com/dvtjorjay/image/upload/v1544774260/rogoyan5x4bheiho9y1f.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774261/yjqtycqaev9xltyq3ajj.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544781312/eric.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544781312/gilles.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544781313/jean.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544781312/leila.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774261/fjleo1xghildf1jijvng.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774262/lb3rgvz7ikpjiythxe81.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774262/dikii7twbo97yjko9lim.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774263/oylp2mr7zi2jjjquapjj.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774263/rs8jczulnbruh234mwyj.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774264/whca2grkgxnlwzeov0vx.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774265/bitozqorm6j1qnropsnp.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774266/tgtfcfis59qiztlsybsv.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774266/m5ws5ai98cpuiqvjry2u.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774267/ahqx23a8uns4sjz9m9jj.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774267/tq4gfvlrsbcz9e9wmo6w.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774268/uvpy0ls8xcq8whedrp1r.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544774268/dh8sozmzqfbkoflhgszt.jpg",
               "https://res.cloudinary.com/dvtjorjay/image/upload/v1544780987/simon.jpg"
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

playlist_urls =["https://res.cloudinary.com/dvtjorjay/image/upload/v1544779627/georgia-vagim-381292-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779627/georgia-vagim-381292-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779626/erik-witsoe-647316-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779625/ahmet-yalcinkaya-84327-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779625/karen-zhao-643916-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782616/felix-mooneeram-222805-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782616/timothy-eberly-382663-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782616/johanna-vogt-477399-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782617/peter-lewicki-411606-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782617/kosta-bratsos-418582-unsplash.jpg",
                "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782626/zack-marshall-408710-unsplash.jpg"
]

puts 'Seeding playlists'
40.times do
  new_playlist = Playlist.create(
  {
    name: Faker::StrangerThings.quote,
    description:Faker::FamilyGuy.quote,
    playlist_date: Date.today,
    user: new_users.sample
  })
  new_playlist.remote_picture_url = playlist_urls.sample
  new_playlist.save!
end

puts 'Seeding playlists Guillaume'


new_playlist = Playlist.create(
  {
    name: 'Feel Good Movies',
    description: 'To make you feel better',
    playlist_date: Date.yesterday,
    user: guigui
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544715314/feel_good_movies.jpg"
  new_playlist.save!


new_playlist = Playlist.create(
{
  name: 'Directed by Canet',
  description: 'Not already proud of ;)',
  playlist_date: Date.today,
  user: guigui
})
new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779761/List-directed_by.jpg"
new_playlist.save!


new_playlist = Playlist.create(
{
  name: 'Incontournables',
  description: "I'll kill you if you tell me you didn't watch these !!",
  playlist_date: Date.today.prev_day,
  user: guigui
})
new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779761/List-incontournable.jpg"
new_playlist.save!


new_playlist = Playlist.create(
  {
    name: 'Inspiring Movies',
    description: "If your actions inspire others to dream more, learn more, do more and become more, you are a leader",
    playlist_date: Date.today.prev_day,
    user: guigui
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779764/List-inspiring.jpg"
  new_playlist.save!


puts 'Seeding playlists Eric Toledano'

new_playlist = Playlist.create(
  {
    name: 'Directed by Toledano',
    description: "First are the best",
    playlist_date: Date.today,
    user: eric
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779758/List-directed_by_2.jpg"
  new_playlist.save!

new_playlist = Playlist.create(
  {
    name: 'Must See',
    description: "Can't die without watching these gold nuggets",
    playlist_date: Date.yesterday,
    user: eric
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779761/List-must_see.jpg"
  new_playlist.save!

new_playlist = Playlist.create(
  {
    name: 'Winter Movies',
    description: "To watch when everything is white",
    playlist_date: Date.today.prev_day,
    user: eric
  })
  new_playlist.remote_picture_url = "https://res.cloudhttps://res.cloudinary.com/dvtjorjay/image/upload/v1544779765/List-winter.jpg"
  new_playlist.save!

new_playlist = Playlist.create(
  {
    name: 'Scary',
    description: "Will make you shit in your pants",
    playlist_date: Date.today.prev_day,
    user: eric
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779765/List-scary.jpg"
  new_playlist.save!


puts 'Seeding playlists Alice'

new_playlist = Playlist.create(
  {
    name: 'A revoir',
    description: "Frissons garantis",
    playlist_date: Date.today.prev_day,
    user: alice
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544779627/georgia-vagim-381292-unsplash.jpg"
  new_playlist.save!

  new_playlist = Playlist.create(
  {
    name: 'En amoureux',
    description: "To get back in bed",
    playlist_date: Date.today.prev_day,
    user: alice
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782104/en-amoureux.jpg"
  new_playlist.save!

new_playlist = Playlist.create(
  {
    name: 'Feel Good Movies Alice',
    description: "When you need to feel better",
    playlist_date: Date.today,
    user: alice
  })
  new_playlist.remote_picture_url = "https://res.cloudinary.com/dvtjorjay/image/upload/v1544782245/feel-good-alice.jpg"
  new_playlist.save!


# puts 'Seeding IMDB movies'

# list_movies1 = ['Die Hard','Harry Potter', 'Bohemian Rhapsody', 'Halloween', 'William & Kate','Rambo', 'Dikkenek','King Kong', 'Aladin', 'Bambi']
# list_movies1.each do |movie|
#   puts movie
#   url = "http://www.omdbapi.com/?t=#{movie}&#{key1}"
#   movie_serialized = open(url).read
#   movie_hash = JSON.parse(movie_serialized)
#   new_category = Category.create(name: movie_hash['Genre'])
#   new_movie = Movie.create!(
#     {
#       title: movie_hash['Title'],
#       director: movie_hash['Director'],
#       release_date: movie_hash['Year'],
#       syllabus: movie_hash['Plot'],
#       duration: movie_hash['Runtime'],
#       actors: movie_hash['Actors'],
#       movie_url: "https://www.imdb.com/title/#{movie_hash['imdbID']}/",
#       rating: movie_hash['imdbRating'].to_i.fdiv(2),
#       price: 2.99,
#       trailer_url: "http://m.imdb.com/title/#{movie_hash['imdbID']}/videogallery",
#       number_rates: movie_hash['imdbVotes'],
#     })
#   new_movie.remote_poster_url = movie_hash['Poster']
#   new_movie.save
#   new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
# end

# sleep(120)

# list_movies2 = ['Toy Story','La verite si je mens', 'The Fall','Dumbo','Creed', 'Love Actually', 'Black Panther','Jumanji', 'The Dark knight', 'Pulp Fiction']
# list_movies2.each do |movie|
#   puts movie
#   url = "http://www.omdbapi.com/?t=#{movie}&#{key2}"
#   movie_serialized = open(url).read
#   movie_hash = JSON.parse(movie_serialized)
#   new_category = Category.create(name: movie_hash['Genre'])
#   new_movie = Movie.create(
#     {
#       title: movie_hash['Title'],
#       director: movie_hash['Director'],
#       release_date: movie_hash['Year'],
#       syllabus: movie_hash['Plot'],
#       duration: movie_hash['Runtime'],
#       actors: movie_hash['Actors'],
#       movie_url: "https://www.imdb.com/title/#{movie_hash['imdbID']}/",
#       rating: movie_hash['imdbRating'].to_i.fdiv(2),
#       price: 2.99,
#       trailer_url: "http://m.imdb.com/title/#{movie_hash['imdbID']}/videogallery",
#       number_rates: movie_hash['imdbVotes'],
#     })
#   new_movie.remote_poster_url = movie_hash['Poster']
#   new_movie.save
#   new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
# end

# sleep(120)

# list_movies3 = ['Inception', 'GoodFellas', 'The pianist', 'The departed', 'Whiplash', 'Gladiator', 'Alien', 'Django Unchained','Coco', 'Roma']
# list_movies3.each do |movie|
#   puts movie
#   url = "http://www.omdbapi.com/?t=#{movie}&#{key3}"
#   movie_serialized = open(url).read
#   movie_hash = JSON.parse(movie_serialized)
#   new_category = Category.create(name: movie_hash['Genre'])
#   new_movie = Movie.create(
#     {
#       title: movie_hash['Title'],
#       director: movie_hash['Director'],
#       release_date: movie_hash['Year'],
#       syllabus: movie_hash['Plot'],
#       duration: movie_hash['Runtime'],
#       actors: movie_hash['Actors'],
#       movie_url: "https://www.imdb.com/title/#{movie_hash['imdbID']}/",
#       rating: movie_hash['imdbRating'].to_i.fdiv(2),
#       price: 2.99,
#       trailer_url: "http://m.imdb.com/title/#{movie_hash['imdbID']}/videogallery",
#       number_rates: movie_hash['imdbVotes'],
#     })
#   new_movie.remote_poster_url = movie_hash['Poster']
#   new_movie.save
#   new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
# end

#   sleep(120)

#   list_movies4 = ['The Notebook', 'A Star Is Born', 'Valentine s Day', 'In Her Shoes', 'Charlies Angels', 'Vanilla Sky ', 'American Sniper', 'Spy Game','The Place Beyond the Pines']
#   list_movies4.each do |movie|
#     puts movie
#     url = "http://www.omdbapi.com/?t=#{movie}&#{key4}"
#     movie_serialized = open(url).read
#     movie_hash = JSON.parse(movie_serialized)
#     new_category = Category.create(name: movie_hash['Genre'])
#     new_movie = Movie.create(
#       {
#         title: movie_hash['Title'],
#         director: movie_hash['Director'],
#         release_date: movie_hash['Year'],
#         syllabus: movie_hash['Plot'],
#         duration: movie_hash['Runtime'],
#         actors: movie_hash['Actors'],
#         movie_url: "https://www.imdb.com/title/#{movie_hash['imdbID']}/",
#         rating: movie_hash['imdbRating'].to_i.fdiv(2),
#         price: 2.99,
#         trailer_url: "http://m.imdb.com/title/#{movie_hash['imdbID']}/videogallery",
#         number_rates: movie_hash['imdbVotes'],
#       })
#     new_movie.remote_poster_url = movie_hash['Poster']
#     new_movie.save
#     new_movie_category = MovieCategory.create(category: new_category, movie: new_movie)
# end

# puts 'Seeding a review for AStarIsBorn'
# first_review = Review.create(rate: 4, comment: "Exceptionnel ! Bradley est beaucoup trop sexy je suis allee le voir 4 fois", review_date: :datetime, movie: Movie.find_by(title: "A Star Is Born"), user: User.find_by(first_name: "Alice"))


# Movie.index

