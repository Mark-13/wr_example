# == Schema Information
#
# Table name: plate_parts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  plate_id   :integer
#  part_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class PlatePart < ActiveRecord::Base

  belongs_to :plate
  belongs_to :part

end
