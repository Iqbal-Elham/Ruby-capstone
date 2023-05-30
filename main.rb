require './app'

class Main
  def initialize
    @app = Application.new
  end

  def manu
    $stdout.sync = true
    puts 'Catalogue of my many things console Application'
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
  
end