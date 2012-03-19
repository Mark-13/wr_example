# == Schema Information
#
# Table name: beers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Beer < ActiveRecord::Base

  default_scope :order => 'beers.slug ASC'

  include ActsAsAdjacent

  attr_accessible :name, :slug, :picture
    
  has_many :beer_images

  def new_picture
    @picture = beer_images[rand(beer_images.count)]
  end
  
  def picture
    @picture
  end	


end
