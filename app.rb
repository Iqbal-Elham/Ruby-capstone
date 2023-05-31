require 'json'
require_relative './classes/genre'
require_relative './classes/music'
require_relative './classes/book'
require_relative './classes/label'

class Application
  attr_reader :books, :games, :music_albums, :genres, :labels, :authors

  def initialize
    @books = []
    @games = []
    @music_albums = []
    @genres = []
    @labels = []
    @authors = []
  end
  # Book part

  def add_label(item)
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter color of the book: '
    color = gets.chomp

    label = Label.new(title, color)
    label.add_item(item)
    store_label(label)
  end

  def store_label(label)
    hash = { id: label.id, title: label.title, color: label.color }

    file = File.empty?('./data/label_list.json') ? [] : JSON.parse(File.read('./data/label_list.json'))
    file << hash
    File.write('./data/label_list.json', JSON.pretty_generate(file))
  end

  def list_all_labels
    puts 'List of all labels:'
    file = File.empty?('./data/label_list.json') ? [] : JSON.parse(File.read('./data/label_list.json'))
    file.each do |label|
      puts "Label ID: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
    end
  end

  # Book part

  def add_book
    print 'Enter the publisher name: '
    publisher = gets.chomp
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Enter the cover state: '
    cover_state = gets.chomp
    book = Book.new(publish_date, cover_state, publisher)
    add_label(book)
    puts 'Book added!'
    store_book(book)
    book
  end

  def store_book(book)
    new_book = {
      id: book.id,
      publish_date: book.publish_date,
      publisher: book.publisher,
      label_id: book.label.title
    }
    if File.exist?('./data/book_list.json')
      file = File.empty?('./data/book_list.json') ? [] : JSON.parse(File.read('./data/book_list.json'))
      file << new_book
      File.write('./data/book_list.json', JSON.pretty_generate(file))
    else
      File.write('./data/book_list.json', JSON.pretty_generate([new_book]))
    end
  end

  def list_all_books
    puts "Book list"
    books = File.empty?('./data/book_list.json') ? [] : JSON.parse(File.read('./data/book_list.json'))
    books.each do |book|
      puts "Published date: #{book['publish_date']}, Publisher: #{book['publisher']}, label: #{book['label_id']}"
    end
  end
  # Genre part

  def add_genre(item)
    print 'Enter genre name: '
    name = gets.chomp

    genre = Genre.new(name)
    genre.add_item(item)
    store_genre(genre)
  end

  def store_genre(genre)
    hash = { id: genre.id, name: genre.name }

    file = File.empty?('./data/genre_list.json') ? [] : JSON.parse(File.read('./data/genre_list.json'))
    file.push(hash)
    File.write('./data/genre_list.json', JSON.pretty_generate(file))
  end

  def list_all_genres
    puts 'List of all genres:'
    file = File.empty?('./data/genre_list.json') ? [] : JSON.parse(File.read('./data/genre_list.json'))
    file.each do |genre|
      puts "Genre: #{genre['id']} - #{genre['name']}"
    end
  end

  # Music part

  def add_music_album
    print 'Is the music on sportify? (Y/N): '
    sportify_value = gets.chomp.downcase == 'y'
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    music_album = Music.new(publish_date, sportify_value)
    add_genre(music_album)
    puts 'Music album added!'
    store_music_album(music_album)
    music_album
  end

  def store_music_album(music)
    new_music = {
      id: music.id,
      publish_date: music.publish_date,
      sportify: music.on_sportify,
      genre_id: music.genre.name
    }
    if File.exist?('./data/music_list.json')
      file = File.empty?('./data/music_list.json') ? [] : JSON.parse(File.read('./data/music_list.json'))
      file.push(new_music)
      File.write('./data/music_list.json', JSON.pretty_generate(file))
    else
      File.write('./data/music_list.json', JSON.pretty_generate([new_music]))
    end
  end

  def list_all_music_albums
    puts "Music album's list"
    musics = File.empty?('./data/music_list.json') ? [] : JSON.parse(File.read('./data/music_list.json'))
    musics.each do |music|
      puts "Published date: #{music['publish_date']}, On sportify: #{music['sportify']}, Genre: #{music['genre_id']}"
    end
  end
end
