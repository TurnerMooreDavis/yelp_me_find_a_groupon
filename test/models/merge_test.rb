require 'test_helper'
require 'merge'
require 'groupon_datum'
require 'yelp_datum'

class GrouponDatum
  def get_data
    JSON.parse(File.open("./test/fixtures/groupon.json").read)
  end
end

class YelpDatum
  def search_yelp(location)
    JSON.parse(File.open("./test/fixtures/yelp.json").read)
  end
end

class MergeTest < ActiveSupport::TestCase

  test "groupons_available returns an array" do
    merge = Merge.new("durham")
    assert_equal Array, merge.groupons_available.class
  end

  test "with_yelp_rating returns an array" do
    a = Merge.new("Durham, NC")
    assert_equal Array, a.with_yelp_rating.class
  end

  test "all_deals returns an array of hashes" do
    true
  end



end
