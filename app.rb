require './classes/genre'
require './classes/music'
require json

class Application
  attr_reader :genres, :music_albums

  def initialize
    @genres = []
    @music_albums = []
  end

  # genre part

  def add_genre(item)
    print "Enter genre name: "
    name = gets.chomp

    genre = Genre.new(name)
    genre.add_item(item)
    store_genre(genre)
  end

  def store_genre(genre)
    hash = { id: genre.id, name: genre.name }

    file = File.read('./data/genre_list.json').zero? ? [] : JSON.parse(file.read('./data/genre_list.json'))
    file.push(hash)
    file.write('./data/genre_list.json', JSON.pretty_generate(file))
  end

  def list_all_genres
    puts "List of all genres:"
    file = File.read('./data/genre_list.json').zero? ? [] : JSON.parse(file.read('./data/genre_list.json'))
    file.each do |genre|
      puts "Genre: #{genre.id} - #{genre['name']}"
    end
  end
end