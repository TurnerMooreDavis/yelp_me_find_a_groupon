class Merge

  def initialize(location)
    @yelp = get_yelp_data(location)
    @groupon = get_groupon_data
    @loc = location
  end

  def get_groupon_data
    GrouponDatum.new
  end

  def get_yelp_data(location)
    YelpDatum.new(location)
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
    groupons.each do |deal|
      begin
        puts "#{deal.merchant_name}\n\n"
        result = @yelp.search_yelp(@loc,deal.merchant_name)
        puts "#{result["businesses"][0]["rating"]}\n\n"
        deal.yelp_rating = result["businesses"][0]["rating"]
      rescue
        deal.yelp_rating = nil
        puts "no rating"
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
    all_groupons.each {|g|
    if g.yelp_rating != nil
      puts "we have a match!!"
    end}
    deals_with_yelp = all_groupons.select{|deal| deal.yelp_rating != nil}
    deals_without_yelp = all_groupons.select{|deal| deal.yelp_rating == nil}
    [{"Deals With Yelp Ratings" => deals_with_yelp},
      {"Deals Without Yelp Ratings" => deals_without_yelp}]
  end


end
