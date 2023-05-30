require 'securerandom'

class Genre
  attr_accessor :name, :items
attr_reader :id

  def initialize(name)
    @name = name
    @id = SecureRandom.uuid
    @items = []
  end
end