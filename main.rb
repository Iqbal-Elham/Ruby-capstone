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
    10 - Exit "
  end

  def prompt
    menu
    choice = gets.chomp.to_i
    options(choice)
    prompt until @choice == 10
  end

  def options(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.add_book
    when 5
      @app.add_music_album
    when 6
      @app.list_all_music_albums
    when 7
      @app.list_all_genres
    when 8
      @app.list_all_labels
    else
      exit
    end
  end
end

app = Main.new
app.prompt
