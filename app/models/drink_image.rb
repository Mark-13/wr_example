# == Schema Information
#
# Table name: drink_images
#
#  id          :integer         not null, primary key
#  credits     :string(255)
#  upload_date :datetime
#  picture     :string(255)
#  drink_id    :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class DrinkImage < ActiveRecord::Base

  belongs_to :drink

end
