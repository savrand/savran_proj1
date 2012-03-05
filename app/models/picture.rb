require "open-uri"

class Picture < ActiveRecord::Base
 attr_accessible :name, :picture, :category_id

 has_many :tagging
 
 belongs_to :category
 belongs_to :album
 has_attached_file :picture, :styles => {  :thumb => "100x100>" }
 default_scope :order => 'pictures.created_at DESC'
 
  def picture_from_url(url)
    self.picture = open(url)
  end

end
