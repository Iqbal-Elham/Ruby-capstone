require_relative 'spec_helper'
require_relative './../classes/item'
require 'rspec'

RSpec.describe Item do
  let(:item) { Item.new('2010-01-01') }

  it 'can be archived if the publish date is older than 10 years' do
    expect(item.send(:can_be_archived?)).to eq true
  end

  it 'cannot be archived if the publish date is within 10 years' do
    current_year = Date.today.year
    publish_date = "#{current_year - 5}-01-01"
    item = Item.new(publish_date)
    expect(item.send(:can_be_archived?)).to eq false
  end

  it 'initializes with the correct attributes' do
    expect(item).to be_an_instance_of(Item)
    expect(item.id).to be_kind_of(String)
    expect(item.publish_date).to eq('2010-01-01')
    expect(item.archived).to eq(false)
  end

  it 'marks the item as archived when moved to archive' do
    item.move_to_archive
    expect(item.archived).to eq(true)
  end

  it 'adds the genre to the item' do
    genre = Genre.new('Mystery')
    item.add_genre(genre)
    expect(item.genre).to eq(genre)
    expect(genre.items).to include(item)
  end

  it 'does not duplicate the item in the genre' do
    genre = Genre.new('Mystery')
    item.add_genre(genre)
    item.add_genre(genre)
    expect(genre.items.length).to eq(1)
  end
end
