#!/usr/bin/env ruby
require './app'

class Main
  def initialize
    @app = Application.new
  end

  def menu
    $stdout.sync = true
    puts 'Welcome to the Catalog of many things console application'
    puts "
    Please choose an option from the list by entering a number:\n
    1 - List all books
    2 - Add a book
    3 - List all games
    4 - Add a game
    5 - Add a music album
    6 - List all music albums
    7 - List all genres
    8 - List all labels
    9 - List all authors
    10 - Add author
    11 - exit "
  end

  def prompt
    menu
    choice = gets.chomp
    options(choice)
    prompt until @choice == 11
  end

  def dictionary
    {
      '1' => :list_all_books,
      '2' => :add_book,
      '3' => :list_all_games,
      '4' => :add_game,
      '5' => :add_music_album,
      '6' => :list_all_music_albums,
      '7' => :list_all_genres,
      '8' => :list_all_labels,
      '9' => :list_all_authors,
      '10' => :add_author
    }
  end

  def options(choice)
    if choice == '11'
      exit
    elsif dictionary[choice]
      @app.send(dictionary[choice])
    else
      print 'Please enter a valid option: '
      valid_option = gets.chomp
      options(valid_option)
    end
  end
end

app = Main.new
app.prompt
