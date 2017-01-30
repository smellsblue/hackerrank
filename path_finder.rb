class PathFinder
  attr_reader :size

  def initialize(from, to)
    @from = from
    @to = to
  end

  def run
    @size = 0
    self
  end
end
