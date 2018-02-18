class Listing < ActiveRecord::Base

  has_many :neighborhoods
  belongs_to :user

end
