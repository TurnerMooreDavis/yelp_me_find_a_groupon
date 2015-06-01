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
    YelpDatum.new(@loc, name)
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
        v = @counter/percent
        puts "#{v}%"
      rescue
        deal.yelp_rating = nil
        @counter += 100.to_f
        percent = groupons.length
        v = @counter/percent
        puts "#{v}%"
      end
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
