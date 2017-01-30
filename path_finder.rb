require "set"

class PathFinder
  attr_reader :size

  def initialize(from, to, check_infinite: true)
    @check_infinite = check_infinite
    @found = Set.new
    @from = from
    @to = to
  end

  def infinite?
    @infinite
  end

  def run
    @size = 0
    @infinite = false
    follow_roads(@from, [])
    @size = "INFINITE PATHS" if infinite?
    self
  end

  private

  def follow_roads(city, path)
    return if infinite?
    path << city

    if city == @to && path.size > 1
      @size += 1

      if @check_infinite
        @infinite = true if path.any? { |x| PathFinder.new(x, x, check_infinite: false).run.size != 0 }
      end
    end

    if @found.include?(city)
      return
    end

    @found << city

    city.each_road do |road|
      follow_roads(road.to, path.dup)
    end
  end
end
