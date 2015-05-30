class MergeController < ApplicationController

  def show
    render json: Merge.new(params[:location])
  end

end
