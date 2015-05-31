class YelpDatum

  def initialize(location)
    @client = Yelp::Client.new( consumer_key: ENV["YELP_CONSUMER_KEY"],
                            consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                            token: ENV["YELP_TOKEN"],
                            token_secret: ENV["YELP_TOKEN_SECRET"]
                          )
    @page = @client.search(location).raw_data
  end

  def length
    @page["businesses"].length
  end

  def search_yelp(location,name)
    @client.search(location,{term:name}).raw_data
  end

  def merchant(m)
    @page["businesses"][m]["name"]
  end

  def rating(m)
    @page["businesses"][m]["rating"]
  end

  def url(m)
    @page["businesses"][m]["url"]
  end

  def review_count(m)
    @page["businesses"][m]["review_count"]
  end

  def review_info(m)
    { m => { "Merchant Name" => merchant(m), "Website" => url(m),
      "Rating" => rating(m), "Number of Reviews" => review_count(m)}}
  end





end
