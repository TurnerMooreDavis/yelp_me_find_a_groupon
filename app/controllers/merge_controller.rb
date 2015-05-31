class MergeController < ApplicationController

  before_action :authenticate

  def index
    render json: Merge.new(params[:location]).all_deals
  end

#show will give only the groupon deals with yelp ratings
  def show
    show = Merge.new(params[:location]).all_deals
    render json: show[0]
  end

  def generate
    key = SecureRandom.hex
    ApiKey.create!(key: key)
    render json: "Your API key is #{key}"
  end

  private def authenticate
  api_key_request = request.headers['X-Security-Key']
  key = ApiKey.where(key: api_key_request).first if api_key_request

    unless key
      head status: :unauthorized
      return false
    end
  end

end
