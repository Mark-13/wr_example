# == Schema Information
#
# Table name: beer_images
#
#  id          :integer         not null, primary key
#  credits     :string(255)
#  upload_date :datetime
#  picture     :string(255)
#  beer_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class BeerImage < ActiveRecord::Base

  belongs_to :beer

end
