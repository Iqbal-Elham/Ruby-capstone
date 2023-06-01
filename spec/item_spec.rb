require_relative 'spec_helper'
require 'securerandom'
require 'date'

describe Item do
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
end
