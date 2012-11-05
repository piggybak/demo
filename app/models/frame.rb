class Frame < ActiveRecord::Base
  attr_accessible :title, :slug, :description, :main

  validates_presence_of :title, :slug

  has_attached_file :main, :styles => { :large => "608x408>" },
    :url => "/system/frames/:id/:style/:basename.:extension"

  acts_as_sellable_with_variants
end
