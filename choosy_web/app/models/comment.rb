class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :image_pair
	validates :user, :image_pair, :body, :presence => true
	validates :body, length: { maximum: 100 }
end
