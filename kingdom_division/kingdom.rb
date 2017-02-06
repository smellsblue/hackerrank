require_relative "city"
require_relative "division_finder"
require_relative "road"

class Kingdom
  def initialize(num_cities)
    @cities = {}

    num_cities.times do |i|
      @cities[i + 1] = City.new(i + 1, self)
    end
  end

  def size
    @cities.size
  end

  def cities
    @cities.values
  end

  def [](city)
    @cities[city]
  end

  def num_divisions
    DivisionFinder.new(self).run.size
  end

  def self.parse(io)
    cities = io.gets.strip.to_i
    kingdom = Kingdom.new(cities)

    (cities - 1).times do
      from, to = io.gets.strip.split(/\s+/).map(&:to_i)
      kingdom[from].add_road(kingdom[to])
    end

    kingdom
  end
end
