# == Schema Information
#
# Table name: drinks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Drink < ActiveRecord::Base

  default_scope :order => 'drinks.slug ASC'

  include ActsAsAdjacent

  attr_accessible :name, :slug, :picture
    
  has_many :drink_images

  def new_picture
    @picture = drink_images[rand(drink_images.count)]
  end
  
  def picture
    @picture
  end	


end
