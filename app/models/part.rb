# == Schema Information
#
# Table name: parts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  content    :string(255)
#  height     :integer
#  width      :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Part < ActiveRecord::Base

  has_many :plate_parts
  has_many :plates, :through => :plate_parts

  def parents  
     plates.all
  end


end
