# == Schema Information
#
# Table name: plates
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  datetime   :datetime
#  precision  :integer
#  tags       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  plate_id   :integer
#

class Plate < ActiveRecord::Base
 
  has_many :templates

  has_many :children, :class_name => "Plate"
  belongs_to :parent, :class_name => "Plate",
    :foreign_key => "plate_id"

  has_many :plate_parts
  has_many :parts, :through => :plate_parts
 
  default_scope :order => 'plates.datetime DESC, plates.name ASC'

  def content_dict 
    h = {}
    cp = content_parts
    cp.each { |p| h[p.name] = p}
    h
  end    
    
  def content_parts 
    parts.where("plate_parts.name LIKE ?  ESCAPE '!' ", "!_!_%").all
  end

  def get_named_part(name) 
    parts.where("plate_parts.name = ?", name).first
  end
   	
  def get_display
    @get_display ||= get_named_part("display")
  end  

  def get_thumbnail
    @get_display ||= get_named_part("thumbnail")
  end  

  def tag_list
    if tags 
      @tag_list ||= tags.split " "
    else 
      @tag_list = []
    end
  end
  
  def datetime_display
    datetime.to_date.to_s(:db)
  end
  

end
