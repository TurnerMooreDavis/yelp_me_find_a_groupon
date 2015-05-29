require 'test_helper'
require 'yelp_datum'

class YelpDatum
  def search_yelp(location)
    JSON.parse(File.open("./test/fixtures/yelp.json").read)
  end
end

class YelpDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "yelp returns data" do
    yelp_data = YelpDatum.new("Durham, NC")
    assert yelp_data
  end

  test "get merchant" do
    yelp_data = YelpDatum.new("Durham, NC")
    assert_equal "Fullsteam Brewery", yelp_data.merchant(0)
  end
end
