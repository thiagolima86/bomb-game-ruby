class Number
  def initialize(size)
    @size = size
  end

  def create
    @number = ENV['env'] == 'test' ? create_to_test : create_rand
    self
  end

  def reveal
    number.join
  end

  def locked
    number.fill('*').join
  end

  def eq?(value)
    value == reveal
  end

  private

  attr_reader :size, :number

  def create_rand
    number = []
    size.times { |count| number.push(rand((count.zero? ? 1 : 0)..9)) }
    number
  end

  def create_to_test
    number = []
    1.upto(size) { |count| number.push(count) }
    number
  end
end