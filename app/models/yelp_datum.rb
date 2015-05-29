class YelpDatum < ActiveRecord::Base

  def initialize(location)
    @client = Yelp::Client.new( consumer_key: ENV["YELP_CONSUMER_KEY"],
                            consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                            token: ENV["YELP_TOKEN"],
                            token_secret: ENV["YELP_TOKEN_SECRET"]
                          )
    @page = search_yelp(location)
  end

  def search_yelp(location)
    @client.search(location)
  end

  def merchant(m)

  end


end
