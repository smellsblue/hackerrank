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
end
