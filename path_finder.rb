require "set"

class PathFinder
  attr_reader :size

  def initialize(from, to)
    @loops = Set.new
    @cities_in_solution = Set.new
    @from = from
    @to = to
  end

  def infinite?
    @infinite
  end

  def run
    @size = 0
    @infinite = false
    follow_roads(@from, [], Set.new)
    @size = "INFINITE PATHS" if infinite?
    self
  end

  private

  def follow_roads(city, path, found)
    return if infinite?
    path << city

    if city == @to && path.size > 1
      @size += 1
      @infinite = true if path.any? { |x| @loops.include?(x) }
    end

    if found.include?(city)
      @loops << city
      @infinite = true if city == @to
      return
    end

    found << city

    city.each_road do |road|
      follow_roads(road.to, path.dup, found.dup)
    end
  end
end
