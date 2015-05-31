require 'test_helper'
require 'groupon_datum'

class GrouponDatum
  def get_data
    JSON.parse(File.open("./test/fixtures/groupon.json").read)
  end
end


class GrouponDatumTest <MiniTest::Test
  def setup
    @g = GrouponDatum.new
  end

  def test_business_name
    assert_equal "Aaron Evans Piano Instruction", @g.merchant_name(0)
  end

  def test_business_website
    assert_equal "http://theajevans.wix.com/aaronevans", @g.merchant_website(0)
  end

  def test_title
    assert_equal "Four Private Music Lessons from Aaron Evans Piano Instruction (50% Off)", @g.deal_title(0)
  end

  def test_deal
    assert_match /A Chat with Aaron Evans/, @g.deal(0)
  end

  def test_deal_url
    assert_equal "http://tracking.groupon.com/r?tsToken=US_AFF_0_201236_212556_0&url=http%3A%2F%2Fwww.groupon.com%2Fdeals%2Faaron-evans-piano-instruction%3Fz%3Dskip%26utm_medium%3Dafl%26utm_source%3DGPN%26utm_campaign%3D201236%26mediaId%3D212556",
    @g.deal_url(0)
  end

  def test_number_of_deals
    assert_equal 75, @g.length
  end

  def test_deal_info_returns_all_groupon_information
    a = @g.deal_info(0)
    assert_equal "Aaron Evans Piano Instruction", a.merchant_name
  end

end
