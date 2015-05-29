class Merge < ActiveRecord::Base
  has_many :groupon_data
  has_many :yelp_data

  def initialize(location)
    @yelp = get_yelp_data(location)
    @groupon = get_groupon_data(location)
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
      groupon_merchants += @groupon.merchant_name(m)
      m += 1
    end
    groupon_merchants
  end

  def with_yelp_rating
    has_yelp_rating = []
    groupons_available.each do |merchant|
      m = 0
      until @yelp.merchant(m) == nil
        if @yelp.merchant(m) == merchant
          has_yelp_rating += merchant
          return
        end
        m += 1
      end
    end
    has_yelp_rating
  end












end
