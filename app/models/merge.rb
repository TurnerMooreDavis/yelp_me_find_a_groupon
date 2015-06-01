class Merge

  def initialize(location, filters)
    @groupon = get_groupon_data
    @loc = location
    @filters = filters
  end

  def get_groupon_data
    GrouponDatum.new("&filters=category:#{@filters}")
  end

  def get_yelp_data(location, name)
    YelpDatum.new(location, name)
  end

  def groupons_available
    groupons = []
    m = 0
    while m < @groupon.length
      groupons << @groupon.deal_info(m)
      m += 1
    end
    groupons
  end

  def add_yelp_rating
    groupons = groupons_available
    @counter = 0
    groupons.each do |deal|
      begin
        result = YelpDatum.new(@loc, deal.merchant_name)
        deal.yelp_rating = result.review_info
        @counter += 100.to_f
        percent = groupons.length
        puts @counter/percent
      rescue
        deal.yelp_rating = nil
        @counter += 100.to_f
        percent = groupons.length
        puts @counter/percent
      end
      # m = 0
      # while m < @yelp.length
      #   p deal.merchant_name
      #   p @yelp.merchant(m)
      #   if deal.merchant_name == @yelp.merchant(m)
      #     deal.yelp_hash_location = m
      #     deal.yelp_rating = @yelp.review_info(m)
      #   end
      #   m += 1
      # end
    end
    groupons
  end

  def all_deals
    all_groupons = add_yelp_rating
    deals_with_yelp = all_groupons.select{|deal| deal.yelp_rating != nil}
    deals_without_yelp = all_groupons.select{|deal| deal.yelp_rating == nil}
    deals_with_yelp = deals_with_yelp.sort_by{|deal| deal.yelp_rating["Rating"]}
    deals_with_yelp = deals_with_yelp.reverse
    [{"Deals With Yelp Ratings" => deals_with_yelp},
      {"Deals Without Yelp Ratings" => deals_without_yelp}]
  end


end
