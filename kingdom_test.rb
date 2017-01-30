#!/usr/bin/env ruby
require "minitest/autorun"
require_relative "kingdom"

class KingdomTest < Minitest::Test
  def test_no_roads
    kingdom = Kingdom.parse(["2 0"])
    assert_equal 0, kingdom.num_paths
  end

  def test_one_road
    kingdom = Kingdom.parse(["2 1", "1 2"])
    assert_equal 1, kingdom.num_paths
  end
end
