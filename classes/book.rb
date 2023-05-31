require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publish_date, cover_state, publisher)
    super(publish_date)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
