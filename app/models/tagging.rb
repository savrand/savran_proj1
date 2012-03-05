class Tagging < ActiveRecord::Base
 attr_accessible :tag_id, :taggeble_id 

 belongs_to :picture
 belongs_to :tag
end
