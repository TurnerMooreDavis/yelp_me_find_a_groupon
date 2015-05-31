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

  def setup
    @merge = Merge.new("Durham, NC")
  end

  test "groupons_available returns an array" do
    assert_equal Array, @merge.groupons_available.class
  end

  test "add_yelp_rating returns an array" do
    assert_equal Array, @merge.add_yelp_rating.class
  end

  test "all_deals returns an array of hashes of groupon deals" do
    assert_equal Array, @merge.all_deals.class
    assert_equal Hash, @merge.all_deals[0].class
    assert_equal "Aaron Evans Piano Instruction", @merge.all_deals[1]["Deals Without Yelp Ratings"][0].merchant_name
  end

end
