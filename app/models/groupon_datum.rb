class GrouponDatum < ActiveRecord::Base
  belongs_to :merge

  # @client = Groupon::Client.new(api_key: ENV["GROUPON_KEY"])
  location_divisions = HTTParty.get("https://partner-api.groupon.com/division.json")
  groupons = HTTParty.get("https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&limit=10&radius=10")
  puts JSON.pretty_generate(groupons)
end
