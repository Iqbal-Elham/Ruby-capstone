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
end