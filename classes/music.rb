require_relative 'item'
class Music < Item
  attr_reader :on_sportify

  def initialize(publish_date, on_sportify)
    super(publish_date)
    @on_sportify = on_sportify
  end

  def can_be_archived?
    super && @on_sportify = true
  end
end
