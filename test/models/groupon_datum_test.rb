require 'test_helper'
require 'groupon_datum'

class GrouponDatum
  def get_data
    JSON.parse(File.open("./test/fixtures/groupon.json").read)
  end
end


class GrouponDatumTest < ActiveSupport::TestCase

  def setup
    @g = GrouponDatum.new
  end

  test "business name" do
    assert_equal "Aaron Evans Piano Instruction", @g.merchant_name(0)
  end

  test "business website" do
    assert_equal "http://theajevans.wix.com/aaronevans", @g.merchant_website(0)
  end

  test "title" do
    assert_equal "Four Private Music Lessons from Aaron Evans Piano Instruction (50% Off)", @g.deal_title(0)
  end

  test "deal" do
    assert_match /A Chat with Aaron Evans/, @g.deal(0)
  end

  test "deal url" do
    assert_equal "http://tracking.groupon.com/r?tsToken=US_AFF_0_201236_212556_0&url=http%3A%2F%2Fwww.groupon.com%2Fdeals%2Faaron-evans-piano-instruction%3Fz%3Dskip%26utm_medium%3Dafl%26utm_source%3DGPN%26utm_campaign%3D201236%26mediaId%3D212556",
    @g.deal_url(0)
  end

  test "number of deals" do
    assert_equal 75, @g.length
  end

  test "deal info returns all groupon information" do
    a = @g.deal_info(0)
    assert_equal "Aaron Evans Piano Instruction", a.merchant_name
  end

end
