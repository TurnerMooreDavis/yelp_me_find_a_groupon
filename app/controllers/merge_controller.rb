class MergeController < ApplicationController

  def index
    render json: Merge.new(params[:location]).add_yelp_rating
  end

#show will give only the groupon deals with yelp ratings
  def show
    show = Merge.new(params[:location]).add_yelp_rating
    render json: show[0]
  end

end
