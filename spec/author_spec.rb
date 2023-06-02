require_relative 'spec_helper'

describe Author do
  before(:each) do
    @author = Author.new('John', 'Doe')
    @game = Game.new(false, '2022-05-28')
  end

  it 'is an instance of Author' do
    expect(@author).to be_an_instance_of(Author)
  end

  it 'author has a firstname' do
    expect(@author.first_name).to eq 'John'
  end

  it 'author has a lastname' do
    expect(@author.last_name).to eq 'Doe'
  end

  it 'add item method adds an item to the items array' do
    @author.add_item(@game)
    expect(@author.items.length).to be > 0
  end
end
