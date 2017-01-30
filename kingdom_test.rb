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

  def test_two_simple_paths
    kingdom = Kingdom.parse(["3 3", "1 2", "2 3", "1 3"])
    assert_equal 2, kingdom.num_paths
  end

  def test_road_past_end
    kingdom = Kingdom.parse(["3 2", "1 3", "3 2"])
    assert_equal 1, kingdom.num_paths
  end
end
