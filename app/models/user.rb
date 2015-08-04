class User < ActiveRecord::Base
  has_many :meetings
  has_many :receivers, :through => :meetings
  has_many :inverse_meetings, :class_name => "Meeting", :foreign_key => "receiver_id"
  has_many :inverse_receivers, :through => :inverse_meetings, :source => :user
  

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # to tell rails which foreign key to use
  has_many :invites, :foreign_key => :sender_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_attached_file :image, :styles => { :small => "64x64#", :med => "100x100#", :large =>"200x200>" }, :default_url =>"http://imgur.com/fj7eOAP"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
  
  belongs_to :invitation
  # to exclude user and user's friends from the users index page
  scope :all_except, ->(user) { where.not(id: (user.friends + user.inverse_friends + [user]).map(&:id))}

    

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

def emailinvitation_token
  emailinvitation.token if emailinvitation
end 

def emailinvitation_token=(token)
  self.emailinvitation = EmailInvitation.find_by_token(token)

end 

# def self.all_except(user)
#   where.not(id: user)
# end



end
