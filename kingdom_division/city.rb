class City
  def initialize
    @roads = []
  end

  def add_road(to)
    @roads << Road.new(self, to)
  end

  def each_road
    @roads.each do |road|
      yield road
    end
  end
end
