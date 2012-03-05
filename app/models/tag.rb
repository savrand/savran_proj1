class Tag < ActiveRecord::Base
  attr_accessible :name
  validates :name, :uniqueness =>true
  has_many :tagging
  has_many :picture, :through => :tagging
end
