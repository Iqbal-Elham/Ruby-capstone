require_relative '../classes/label'

describe Label do
  let(:label) { Label.new('The alchemist', 'blue') }
  let(:item) { Item.new('2022-06-14') }

  it 'is an instance of label' do
    expect(label).to be_an_instance_of Label
  end

  it 'should return the title of the book to alchemist' do
    expect(label.title).to eq 'The alchemist'
  end

  it 'should return the color the book to blue' do
    expect(label.color).to eq 'blue'
  end

  describe '#add_item method' do
    it 'should add an item to the label' do
      label.add_item(item)
      expect(label.item[0]).to be(item)
    end

    it 'should add the item and return the lenght 2' do
      label.add_item(item)
      label.add_item(item)
      expect(label.item.length).to eq(2)
    end

    it 'should add the label to the item' do
      label.add_item(item)
      expect(item.label).to be(label)
    end
  end


end
