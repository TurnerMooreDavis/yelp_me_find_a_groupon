class Merge < ActiveRecord::Base
  has_many :groupon_data
  has_many :yelp_data

  def initialize(location)
    @yelp = get_yelp_data(location)
    @groupon = get_groupon_data
  end

  def get_groupon_data
    GrouponDatum.new
  end

  def get_yelp_data(location)
    YelpDatum.new(location)
  end

  def groupons_available
    groupon_merchants = []
    m = 0
    until merchant_name(m) == nil do
      groupon_merchants += {m => @groupon.merchant_name(m)}
      m += 1
    end
    groupon_merchants
  end

  def with_yelp_rating
    @has_yelp_rating = []
    groupons_available.each do |key, merchant|
      m = 0
      until @yelp.merchant(m) == nil
        if @yelp.merchant(m) == merchant
          has_yelp_rating += {m => merchant}
          return
        end
        m += 1
      end
    end
    @has_yelp_rating
  end

  def all_deals
    deals_with_yelp = []
    deals_without_yelp = []
    groupons = groupons_available
    yelp = has_yelp_rating
    groupons.each do |key, deal|
      if yelp.has_value? deal
        deals_with_yelp += @groupon.deal_info(key)
      else
        deals_without_yelp += @groupon.deal_info(key)
      end
    end
    [{"Deals With Yelp Ratings" => deals_with_yelp},
      {"Deals Without Yelp Ratings" => deals_without_yelp}]
  end

  def add_yelp_rating
    deals = all_deals
    spot = @has_yelp_rating.select{|merchant| merchant.value == ["Deals With Yelp Ratings"][m]["Merchant Name"]}
    m = 0
    until m == nil
      deals["Deals With Yelp Ratings"][m]["Yelp Rating Information"] ||= @yelp.review_info(spot)
      m += 1
    end
    deals
  end










end
