class GrouponDatum < ActiveRecord::Base

  @client = Groupon::Client.new(api_key: ENV["GROUPON_KEY"])
end
