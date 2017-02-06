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
    assert_kingdom 2, <<-EOS
      2
      1 2
    EOS
  end

  def test_3_cities
    assert_kingdom 2, <<-EOS
      3
      1 2
      2 3
    EOS
  end

  def test_4_cities
    assert_kingdom 4, <<-EOS
      4
      1 2
      2 3
      3 4
    EOS

    assert_kingdom 2, <<-EOS
      4
      1 2
      2 3
      2 4
    EOS
  end

  def test_5_cities
    assert_kingdom 6, <<-EOS
      5
      1 2
      2 3
      3 4
      4 5
    EOS

    assert_kingdom 4, <<-EOS
      5
      1 2
      1 3
      3 4
      3 5
    EOS

    assert_kingdom 4, <<-EOS
      5
      1 2
      2 3
      2 4
      3 5
    EOS

    assert_kingdom 2, <<-EOS
      5
      1 2
      2 3
      2 4
      2 5
    EOS
  end

  def test_6_cities
    assert_kingdom 10, <<-EOS
      6
      1 2
      2 3
      3 4
      4 5
      5 6
    EOS

    assert_kingdom 6, <<-EOS
      6
      1 2
      2 3
      3 4
      4 5
      4 6
    EOS

    assert_kingdom 4, <<-EOS
      6
      1 2
      2 3
      2 4
      4 5
      4 6
    EOS

    assert_kingdom 2, <<-EOS
      6
      1 2
      1 3
      1 4
      1 5
      1 6
    EOS

    assert_kingdom 8, <<-EOS
      6
      1 2
      2 3
      3 4
      3 5
      5 6
    EOS

    assert_kingdom 4, <<-EOS
      6
      1 2
      2 3
      3 4
      3 5
      3 6
    EOS
  end

  def test_7_cities
    assert_kingdom 16, <<-EOS
      7
      1 2
      2 3
      3 4
      4 5
      5 6
      6 7
    EOS

    assert_kingdom 10, <<-EOS
      7
      1 2
      2 3
      3 4
      4 5
      5 6
      5 7
    EOS

    assert_kingdom 12, <<-EOS
      7
      1 2
      2 3
      3 4
      4 5
      4 6
      6 7
    EOS

    assert_kingdom 6, <<-EOS
      7
      1 2
      2 3
      3 4
      4 5
      4 6
      4 7
    EOS

    assert_kingdom 4, <<-EOS
      7
      1 2
      2 3
      3 4
      3 5
      3 6
      3 7
    EOS

    assert_kingdom 2, <<-EOS
      7
      1 2
      1 3
      1 4
      1 5
      1 6
      1 7
    EOS

    assert_kingdom 8, <<-EOS
      7
      1 2
      2 3
      3 4
      3 5
      3 6
      6 7
    EOS

    assert_kingdom 4, <<-EOS
      7
      1 2
      2 3
      2 4
      2 5
      5 6
      5 7
    EOS

    assert_kingdom 14, <<-EOS
      7
      1 2
      2 3
      3 4
      4 5
      3 6
      6 7
    EOS

    assert_kingdom 8, <<-EOS
      7
      1 2
      2 3
      3 4
      3 5
      5 6
      5 7
    EOS
  end

  private

  def assert_kingdom(expected, input)
    kingdom = Kingdom.parse(StringIO.new(strip_whitespace(input)))
    assert_equal expected, kingdom.num_divisions
  end

  def strip_whitespace(string)
    string.gsub(string[/^( +)/, 1], "")
  end
end
