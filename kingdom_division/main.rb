#!/usr/bin/env ruby
require_relative "kingdom"

def main
  kingdom = Kingdom.parse(STDIN)
  puts kingdom.num_divisions
end

main
