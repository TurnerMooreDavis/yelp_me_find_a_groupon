require 'groupon_datum.rb'
require 'yelp_datum.rb'

class MergeController < ApplicationController

  def index
    render json: YelpDatum.new(params[:location])
  end

#show will give only the groupon deals with yelp ratings
  def show
    show = Merge.new(params[:location]).all_deals
    render json: show[0]
  end

end
