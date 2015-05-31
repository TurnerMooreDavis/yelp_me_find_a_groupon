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

class MergeTest <MiniTest::Test

  def setup
    @merge = Merge.new("Durham, NC")
  end

  def test_groupons_available_returns_an_array
    assert_equal Array, @merge.groupons_available.class
  end

  def test_add_yelp_rating_returns_an_array
    assert_equal Array, @merge.add_yelp_rating.class
  end

  def test_all_deals_returns_an_array_of_hashes_of_groupon_deals
    assert_equal Array, @merge.all_deals.class
    assert_equal Hash, @merge.all_deals[0].class
    assert_equal "Aaron Evans Piano Instruction", @merge.all_deals[1]["Deals Without Yelp Ratings"][0].merchant_name
  end

end
