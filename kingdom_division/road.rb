class Road
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def destination(city)
    if from == city
      to
    elsif to == city
      from
    end
  end
end
