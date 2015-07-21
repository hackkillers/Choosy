class ImagePair < ActiveRecord::Base
  belongs_to :user
  has_many :images, :dependent => :destroy
  validates :user, :presence => true
end
