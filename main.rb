#!/usr/bin/env ruby
require_relative "kingdom"
require_relative "city"
require_relative "road"

def parse(file)
  lines = File.readlines(file)
  cities, roads = lines.shift.strip.split(/\s+/).map(&:to_i)
  kingdom = Kingdom.new(cities)

  roads.times do |i|
    from, to = lines[i].strip.split(/\s+/).map(&:to_i)
    kingdom[from].add_road(kingdom[to])
  end

  kingdom
end

def main
  kingdom = parse(ARGV.first)
end

main
