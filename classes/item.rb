require 'securerandom'
class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = id || SecureRandom.uuid
    @publish_date = publish_date
    @archived = false
  end

end
