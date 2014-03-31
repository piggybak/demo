class Frame < ActiveRecord::Base
  validates :title, presence: true
  validates :slug, presence: true

  has_attached_file :main, :styles => { :large => "608x408>" },
    :url => "/system/frames/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/frames/:id/:style/:basename.:extension"

  acts_as_sellable_with_variants
end
