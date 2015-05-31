class MergeController < ApplicationController

  def index
    render json: Merge.new("Durham, NC").all_deals
  end

#show will give only the groupon deals with yelp ratings
  def show
    show = Merge.new(params[:location]).all_deals
    render json: show[0]
  end

end
