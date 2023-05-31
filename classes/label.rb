require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :id

  def initialize(title, color)
    @id = id || SecureRandom.uuid
    @title = title
    @color = color
    @item = []
  end

  def add_item(item)
    @item << item
    item.label = self
  end
end
