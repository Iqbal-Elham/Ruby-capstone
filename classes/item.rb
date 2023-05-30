require 'securerandom'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived