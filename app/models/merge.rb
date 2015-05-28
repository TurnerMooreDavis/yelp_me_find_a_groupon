class Merge < ActiveRecord::Base
  has_many :groupon_data
  has_many :yelp_data

end
