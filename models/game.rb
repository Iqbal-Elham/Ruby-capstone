require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer
  attr_reader :last_played_at

  def initialize(multiplayer, last_played)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played
  end

  def can_be_archived?
    super.can_be_archived? == 5 && is_greater_tnan?(@last_played_at)
  end

  def greater_tnan?(date)
    date_now = Time.now
    year = date_now.year
    month = date_now.mon
    day = date_now.day

    (year - date.year) > 2 && month >= date.month && day >= date.year
  end
end
