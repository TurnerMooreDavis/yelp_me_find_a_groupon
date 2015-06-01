class YelpDatum

  def initialize(location, name)
    @client = Yelp::Client.new( consumer_key: ENV["YELP_CONSUMER_KEY"],
                            consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                            token: ENV["YELP_TOKEN"],
                            token_secret: ENV["YELP_TOKEN_SECRET"]
                          )
    @page = @client.search(location,{term:name}).raw_data
  end

  def length
    @page["businesses"].length
  end

  def merchant
    @page["businesses"][0]["name"]
  end

  def rating
    @page["businesses"][0]["rating"]
  end

  def url
    @page["businesses"][0]["url"]
  end

  def review_count
    @page["businesses"][0]["review_count"]
  end

  def review_info
    { "Website" => url,
      "Rating" => rating, "Number of Reviews" => review_count}
  end





end
