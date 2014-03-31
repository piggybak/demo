class Image < ActiveRecord::Base
  has_attached_file :gallery, :styles => { :cart => "72x35",
    :thumb => '288x140' },
    :url => "/system/galleries/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/galleries/:id/:style/:basename.:extension"
  has_attached_file :main, :styles => { :large => "608x408>" },
    :url => "/system/mains/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/mains/:id/:style/:basename.:extension"

  validates_presence_of :title
  validates_presence_of :slug
  validates_presence_of :user_id
  validates_uniqueness_of :slug

  belongs_to :user

  acts_as_sellable

  def weight
    10
  end

  def to_param
    self.slug
  end
end
