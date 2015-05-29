<<<<<<< HEAD
class YelpDatum
=======
class YelpDatum < ActiveRecord::Base
>>>>>>> ab00f609d639b375f0b933a49659fed1158ccd3b

  def initialize(location)
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
    @results["businesses"][m]["name"]
  end


end
