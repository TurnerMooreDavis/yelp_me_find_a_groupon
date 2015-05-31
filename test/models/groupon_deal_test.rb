require 'test_helper'

class GrouponDealTest <MiniTest::Test

  def setup
    @object = GrouponDeal.new(merchant_name: "fake name", website: "fake website",
                    title: "fake title", deal: "fake deal", link: "fake url",
                    groupon_hash_location: "fake spot")
  end

  def test_can_be_initialized
    assert @object
  end

  def test_object_has_name
    assert_equal "fake name", @object.merchant_name
  end

end
