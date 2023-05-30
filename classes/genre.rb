require 'securerandom'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = id || SecureRandom.uuid
    @name = name
    @item = []
  end

  
end
