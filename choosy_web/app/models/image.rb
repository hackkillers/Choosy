class Image < ActiveRecord::Base
  belongs_to :image_pair
  validates :image_pair, :presence => true

  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
