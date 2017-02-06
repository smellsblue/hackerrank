class DivisionFinder
  attr_reader :size

  def initialize(kingdom)
    @kingdom = kingdom
  end

  def run
    @size = 0

    each_solution({}, @kingdom.cities) do |solution|
      @size += 1 if solution.safe?
    end

    self
  end

  def each_solution(mapping, remaining_cities, &block)
    if remaining_cities.empty?
      block.call(Solution.new(@kingdom, mapping))
    else
      possible = mapping.dup
      remaining = remaining_cities.dup
      city = remaining.pop
      possible[city.id] = :mike
      each_solution(possible, remaining, &block)

      possible = mapping.dup
      possible[city.id] = :julian
      each_solution(possible, remaining, &block)
    end
  end

  class Solution
    def initialize(kingdom, mapping)
      @kingdom = kingdom
      @mapping = mapping
    end

    def safe?
      1.upto(@kingdom.size) do |i|
        city = @kingdom[i]
        owner = @mapping[i]
        destinations = @kingdom[i].roads.map { |road| road.destination(city) }
        return false if destinations.none? { |d| @mapping[d.id] == owner }
      end

      true
    end
  end
end
