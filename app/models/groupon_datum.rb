class GrouponDatum < ActiveRecord::Base

  # @client = Groupon::Client.new(api_key: ENV["GROUPON_KEY"])
  def initialize
    @page = get_data
  end

  def get_data
    location_divisions = HTTParty.get("https://partner-api.groupon.com/division.json")
    groupons = HTTParty.get("https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&limit=10&radius=10")
  end

  def length
    @page["deals"].length
  end

  def merchant_name(m)
    @page["deals"][m]["merchant"]["name"]
  end

  def merchant_website(m)
    @page["deals"][m]["merchant"]["websiteUrl"]
  end

  def deal_title(m)
    @page["deals"][m]["title"]
  end

  def deal(m)
    @page["deals"][m]["pitchHtml"]
  end

  def deal_url(m)
    @page["deals"][m]["dealUrl"]
  end

  def deal_info(m)
    GrouponDeal.new(merchant_name: merchant_name(m), website: merchant_website(m),
                    title: deal_title(m), deal: deal(m), link: deal_url(m),
                    groupon_hash_location: m)
  end

end
