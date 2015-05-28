class GrouponController < ApplicationController
  def initialize
    @client = Groupon::Client.new(api_key: ENV["GROUPON_KEY"])
  end

end
