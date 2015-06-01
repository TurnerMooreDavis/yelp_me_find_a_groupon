class GrouponDeal
  attr_reader :merchant_name, :website, :title, :deal, :link, :groupon_hash_location, :yelp_rating
  attr_accessor :yelp_rating

  def initialize(merchant_name:, website:, title:, deal:, link:, groupon_hash_location:, yelp_rating: nil)
    @merchant_name = merchant_name
    @website = website
    @title = title
    @deal = deal
    @link = link
    @groupon_hash_location = groupon_hash_location
    @yelp_rating = yelp_rating
  end

end
