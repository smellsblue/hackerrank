#!/usr/bin/env ruby
require "minitest/autorun"
require "stringio"
require_relative "kingdom"

class KingdomTest < Minitest::Test
  def test_parsing
    kingdom = Kingdom.parse(StringIO.new(strip_whitespace(<<-EOS)))
      5
      1 2
      1 3
      3 4
      3 5
    EOS

    assert_equal kingdom[2], kingdom[1].roads[0].to
    assert_equal kingdom[1].roads[0], kingdom[2].roads[0]

    assert_equal kingdom[3], kingdom[1].roads[1].to
    assert_equal kingdom[1].roads[1], kingdom[3].roads[0]

    assert_equal kingdom[4], kingdom[3].roads[1].to
    assert_equal kingdom[3].roads[1], kingdom[4].roads[0]

    assert_equal kingdom[5], kingdom[3].roads[2].to
    assert_equal kingdom[3].roads[2], kingdom[5].roads[0]
  end

  def test_2_cities
    kingdom = Kingdom.parse(StringIO.new(strip_whitespace(<<-EOS)))
      2
      1 2
    EOS

    assert_equal 2, kingdom.num_divisions
  end

  private

  def strip_whitespace(string)
    string.gsub(string[/^( +)/, 1], "")
  end
end
