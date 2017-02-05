#!/usr/bin/env ruby
require_relative "kingdom"

def main
  kingdom = Kingdom.parse(File.readlines(ARGV.first))
end

main
