require_relative('spec_helper')

describe Genre do
  let(:genre) { Genre.new('Rock') }

  it 'is an instance of Genre' do
    expect(genre).to be_an_instance_of Genre
  end

  it 'has a name' do
    expect(genre.name).to eq 'Rock'
  end

  it 'has an id' do
    expect(genre.id).to_not be_nil
  end
end
