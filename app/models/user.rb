class User < ActiveRecord::Base
  # to tell rails which foreign key to use
  has_many :invites, :foreign_key => :sender_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
	has_attached_file :image, :styles => { small: "64x64", med: "100x100", large: "200x200" }, :default_url =>"robot.png"
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.firstname = auth.info.first_name
    user.lastname = auth.info.last_name
    user.image = auth.info.image
    
    end
  end

end
