# == Schema Information
#
# Table name: templates
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  plate_id   :integer
#  text       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Template < ActiveRecord::Base

  belongs_to :plate

end
