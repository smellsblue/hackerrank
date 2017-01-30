class City
  attr_accessor :financial, :warfare

  def initialize
    @roads = []
  end

  def add_road(to)
    @roads << Road.new(self, to)
  end
end
