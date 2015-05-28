class MergeController < ApplicationController

  @merge = Merge.find(params[:id])
  @yelp = @merge.yelp_datum
  @groupon = @merge.groupon_datum

end
