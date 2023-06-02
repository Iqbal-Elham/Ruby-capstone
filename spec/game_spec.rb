require_relative 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new(false, Date.new(2021, 5, 5))
  end

  it 'is an instance of Game' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'has a last played date' do
    expect(@game.last_played_at).to eql(Date.new(2021, 5, 5))
  end

  it 'can be archived method to return false' do
    expect(@game.can_be_archived?).to eql(false)
  end

  it 'greater than method to return true' do
    expect(@game.greater_tnan?(@game.last_played_at)).to eql(false)
  end
end
