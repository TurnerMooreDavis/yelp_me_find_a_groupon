class YelpDatum

  def initialize
    @client = Yelp::Client.new( consumer_key: ENV["YELP_CONSUMER_KEY"],
                            consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                            token: ENV["YELP_TOKEN"],
                            token_secret: ENV["YELP_TOKEN_SECRET"]
                          )
  end

  def search_yelp(location)
    @results = @client.search(location).raw_data
  end

  def merchant(m)
    puts_me = @results["businesses"][m]["name"]
    p puts_me
  end


end
