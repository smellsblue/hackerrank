class City
  attr_reader :roads

  def initialize
    @roads = []
  end

  def add_road(to)
    road = Road.new(self, to)
    @roads << road
    to.add_incoming_road(road)
  end

  def each_road
    @roads.each do |road|
      yield road
    end
  end

  protected

  def add_incoming_road(road)
    @roads << road
  end
end
