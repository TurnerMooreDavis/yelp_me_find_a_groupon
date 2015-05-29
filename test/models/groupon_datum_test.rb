require 'test_helper'

class GrouponDatum
  def get_data
    JSON.parse(File.open("./fixtures/groupon.json").read)
  end
end


class GrouponDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "business name" do
    g = GrouponDatum.new
    assert_equal "Frank White Photography", g.merchant_name
  end


end
