require 'test_helper'

# class GrouponDatum
#   def get_data
#     JSON.parse(File.open("./fixtures/groupon.json").read)
#   end
# end


class GrouponDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "business name" do
    g = GrouponDatum.new
    assert_equal "Frank White Photography", g.merchant_name(0)
  end

  test "business website" do
    g = GrouponDatum.new
    assert_equal "http://frankwhitephotography.com", g.merchant_website(0)
  end

  test "title" do
    g = GrouponDatum.new
    assert_equal "$45 for $99 Toward Outdoor Portraits at Frank White Photography", g.deal_title(0)
  end

  test "deal" do
    g = GrouponDatum.new
    assert_match /Every local community has a story/, g.deal(0)
  end

  test "deal url" do
    g = GrouponDatum.new
    assert_equal "http://tracking.groupon.com/r?tsToken=US_AFF_0_201236_212556_0&url=https%3A%2F%2Fwww.groupon.com%2Fdeals%2Ffrank-white-photography%3Fz%3Dskip%26utm_medium%3Dafl%26utm_source%3DGPN%26utm_campaign%3D201236%26mediaId%3D212556",
    g.deal_url(0)
  end

end
