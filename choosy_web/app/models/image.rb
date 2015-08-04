class Image < ActiveRecord::Base
  belongs_to :image_pair
  validates :image_pair, :presence => true

  has_attached_file :avatar
  
  validates_attachment :avatar, :presence => true,
    :content_type => { :content_type => "image/jpeg" }

end
