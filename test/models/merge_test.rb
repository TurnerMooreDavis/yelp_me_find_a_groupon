require 'test_helper'

class MergeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "groupons_available returns an array" do
    merge = Merge.new("durham")
    assert_equal Array, merge.groupons_available
  end

  test "with_yelp_rating returns an array" do

  end

  test "all_deals returns an array of hashes" do

  end



end
