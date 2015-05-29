class Merge < ActiveRecord::Base
  has_many :groupon_data
  has_many :yelp_data

  def initialize
    @merge = Merge.new()
    @yelp = @merge.yelp_datum
    @groupon = @merge.groupon_datum
  end
  
  def get_groupon_data
    @groupon.get_data
  end

  def get_yelp_data
    @yelp.search_yelp
  end


end
