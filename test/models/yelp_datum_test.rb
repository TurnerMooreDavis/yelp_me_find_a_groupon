require 'test_helper'
require 'yelp_datum'

class YelpDatum
  def initialize
    @page = JSON.parse(File.open("./test/fixtures/yelp.json").read)
  end
end

class YelpDatumTest < MiniTest::Test

  def setup
    @yelp_data = YelpDatum.new
  end

  def test_yelp_returns_data
    assert @yelp_data
  end

  def test_get_merchant
    assert_equal "Fullsteam Brewery", @yelp_data.merchant(0)
  end

  def test_get_rating
    assert_equal 4.5, @yelp_data.rating(2)
    assert_equal 4, @yelp_data.rating(3)
  end

  def test_get_url
    assert_equal "http://www.yelp.com/biz/cocoa-cinnamon-durham", @yelp_data.url(1)
    assert_equal "http://www.yelp.com/biz/fullsteam-brewery-durham", @yelp_data.url(0)
  end

  def test_get_review_count
    assert_equal 279, @yelp_data.review_count(0)
    assert_equal 174, @yelp_data.review_count(1)
  end

  def test_get_review_info
    assert_equal Hash, @yelp_data.review_info(0).class
  end
end
