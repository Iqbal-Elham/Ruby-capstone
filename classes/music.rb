require 'securerandom'

class Music
  attr_accessor :name, :items
  attr_reader :id

  def initialize(publish_date, on_sportify)
    super(publish_date)
    @on_sportify = on_sportify
  end
end