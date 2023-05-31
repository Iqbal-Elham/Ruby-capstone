require_relative '../models/author'

describe Author do
  before(:each) do
    @author = Author.new('John', 'Doe')
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
end
