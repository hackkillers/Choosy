class ImagePair < ActiveRecord::Base
  belongs_to :user
  has_many :images, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  validates :user, :caption, :presence => true
  validates :caption, :length => { maximum: 60 }

  accepts_nested_attributes_for :comments, :allow_destroy => true
end
