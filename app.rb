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

  # Music part

  def add_music_album
    print "Is the music on sportify? (Y/N): "
    sportify_value = gets.chomp.downcase == 'y'
    print "Enter publish date (YYYY-MM-DD): "
    publish_date = gets.chomp
    music_album = Music.new(publish_date, sportify_value)
    add_genre(music)
    puts "Music album added!"
    store_music_album(music)
    music
  end

  def store_music(music)
    new_music = { id: music.id, publish_date: music.publish_date, sportify: music.on_sportify, genre_id: music.genre.name }
    if File.exist?('./data/music_list.json')
      file = File.size('./data/music_list.json').zero? ? [] : JSON.parse(File.read('./data/music_list.json'))
      file.push(new_music)
      File.write('./data/music_list.json', JSON.pretty_generate(file))
    else
      File.write('./data/music_list.json', JSON.pretty_generate([new_music]))
    end
  end
end