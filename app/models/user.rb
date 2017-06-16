class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :message ,dependent: :destroy
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook,:google_oauth2,:linkedin]
  def self.from_omniauth(auth)
   	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.email = auth.info.email
      user.name = auth.info.name
    	user.password = Devise.friendly_token[0,20]
      user.image =auth.info.image.gsub("http","https")
  	end
	end
end
