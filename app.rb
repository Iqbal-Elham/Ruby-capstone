require './classes/genre'
require './classes/music'
require json

class Application
  attr_reader :genres, :music_albums

  def initialize
    @genres = []
    @music_albums = []
  end
end