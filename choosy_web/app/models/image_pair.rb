class ImagePair < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  validates :user, :presence => true
end
