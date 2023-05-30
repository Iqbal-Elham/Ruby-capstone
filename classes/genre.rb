require 'securerandom'

class Genre
  attr_accessor :name, :items
  att_reader :id

  def initialize(name)
    @name = name
    @id = SecureRandom.uuid
    @items = []
  end
end