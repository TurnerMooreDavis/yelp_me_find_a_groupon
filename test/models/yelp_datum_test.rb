require 'test_helper'

class YelpDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "yelp returns data" do
    yelp_data = YelpDatum.new
    p yelp_data
    assert yelp_data
  end
end
