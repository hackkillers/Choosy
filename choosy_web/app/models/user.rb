require "open-uri"

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         
	has_many :image_pairs, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :nickname, length: { maximum: 15 }

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.avatar = open(auth.info.image.gsub("http", "https"))
        user.password = Devise.friendly_token[0,20]
        user.nickname = auth.info.first_name + auth.info.last_name
      end
  end
end