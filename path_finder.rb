require "set"

class PathFinder
  attr_reader :size

  def initialize(from, to)
    @found = Set.new
    @from = from
    @to = to
  end

  def run
    @size = 0
    follow_roads(@from)
    self
  end

  private

  def follow_roads(city)
    @found << city

    if city == @to
      @size += 1
    end

    city.each_road do |road|
      follow_roads(road.to)
    end
  end
end
