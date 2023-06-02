require_relative '../classes/book'

describe Book do
  let(:book) { Book.new('2023-06-01', 'bad', 'Infinity') }

  it 'is an instance of book' do
    expect(book).to be_an_instance_of Book
  end

  it 'has a publish date' do
    expect(book.publish_date).to eq '2023-06-01'
  end

  it 'should return the cover state to good' do
    expect(book.cover_state).to eq 'bad'
  end

  it 'should return the name of publisher to Infinity' do
    expect(book.publisher).to eq 'Infinity'
  end

  describe '#can_be_archived method' do
    it 'should return true if date is earlier than 10 years' do
      book = Book.new('2000-06-01', 'good', 'Infinity')
      expect(book.can_be_archived?).to eq(true)
    end

    it 'should return true if cover_state is bad' do
      book = Book.new('2023-06-01', 'bad', 'Infinity')
      expect(book.can_be_archived?).to eq(true)
    end

    it 'should return false if cover_state not bad and date is not less than 10 years' do
      book = Book.new('2023-06-01', 'good', 'Infinity')
      expect(book.can_be_archived?).to eq(false)
    end
  end
end
