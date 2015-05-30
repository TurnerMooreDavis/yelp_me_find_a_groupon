require 'test_helper'
require 'yelp_datum'

class YelpDatum
  def search_yelp(location)
    JSON.parse(File.open("./test/fixtures/yelp.json").read)
  end
end

class YelpDatumTest < ActiveSupport::TestCase

  def setup
    @yelp_data = YelpDatum.new("Durham, NC")
  end

  test "yelp returns data" do
    assert @yelp_data
  end

  test "get merchant" do
    assert_equal "Fullsteam Brewery", @yelp_data.merchant(0)
  end

  test "get rating" do
    assert_equal 4.5, @yelp_data.rating(2)
    assert_equal 4, @yelp_data.rating(3)
  end

  test "get url" do
    assert_equal "http://www.yelp.com/biz/cocoa-cinnamon-durham", @yelp_data.url(1)
    assert_equal "http://www.yelp.com/biz/fullsteam-brewery-durham", @yelp_data.url(0)
  end

  test "get review count" do
    assert_equal 279, @yelp_data.review_count(0)
    assert_equal 174, @yelp_data.review_count(1)
  end

  test "get review info" do
    assert_equal Hash, @yelp_data.review_info(0).class
  end
end
