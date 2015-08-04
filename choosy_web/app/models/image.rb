class Image < ActiveRecord::Base
  belongs_to :image_pair
  validates :image_pair, :avatar, :presence => true

  has_attached_file :avatar
  
  validates_attachment_content_type :avatar, 
                                    :content_type => /^image\/(png|jpg|jpeg)/,
                                    :message => 'only (png/jpg/jpeg) images'

end
