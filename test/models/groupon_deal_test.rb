require 'test_helper'

class GrouponDealTest < ActiveSupport::TestCase

  def setup
    @object = GrouponDeal.new(merchant_name: "fake name", website: "fake website",
                    title: "fake title", deal: "fake deal", link: "fake url",
                    groupon_hash_location: "fake spot")
  end

  test "can be initialized" do
    assert @object
  end

  test "object has name" do
    assert_equal "fake name", @object.merchant_name
  end
  
end
