class GrouponDeal < ActiveRecord::Base
  attr_reader :merchant_name, :website, :title, :deal, :link, :groupon_hash_location, :yelp_hash_location, :yelp_rating

  def initialize(merchant_name:, website:, title:, deal:, link:, groupon_hash_location:, yelp_hash_location: nil, yelp_rating: nil)

  end

end
