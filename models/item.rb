class Item
  attr_reader :author, :id, :label, :publish_date

  def initialize(label, publish_date)
    @id = Random.rand(1..1000)
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    greater_tnan?(@publish_date)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def greater_tnan?(date)
    date_now = Time.now
    year = date_now.year
    month = date_now.mon
    day = date_now.day

    (year - date.year) >= 10 && month <= date.month && day <= date.year
  end
end
