require_relative('spec_helper')

describe Music do
  let(:music) { Music.new('2021-01-01', true) }

  it 'is an instance of Music' do
    expect(music).to be_an_instance_of Music
  end

  it 'has a publish date' do
    expect(music.publish_date).to eq '2021-01-01'
  end

  it 'has a sportify value' do
    expect(music.on_sportify).to eq true
  end
end
