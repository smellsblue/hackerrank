require_relative "city"
require_relative "road"

class Kingdom
  def initialize(num_cities)
    @cities = {}

    num_cities.times do |i|
      @cities[i + 1] = City.new
    end

    @cities[1].financial = true
    @cities[num_cities].warfare = true
  end

  def [](city)
    @cities[city]
  end

  def num_paths
    0
  end

  def self.parse(lines)
    cities, roads = lines.shift.strip.split(/\s+/).map(&:to_i)
    kingdom = Kingdom.new(cities)

    roads.times do |i|
      from, to = lines[i].strip.split(/\s+/).map(&:to_i)
      kingdom[from].add_road(kingdom[to])
    end

    kingdom
  end
end
