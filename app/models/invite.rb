class Invite < ActiveRecord::Base
	belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
	belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

	has_many :messages, dependent: :destroy
	# ensures that the sender_id and the recipient_id are always unique so that we only have unique invites in our application
	validates_uniqueness_of :sender_id, :scope => :recipient_id
	 #retrieve all invites of the currently logged-in user
	scope :involving, -> (user) do
		where("invites.sender_id =? OR invites.recipient_id =?",user.id,user.id)
	end
	#check if a invite exists between any given two users before we create the invite
	scope :between, -> (sender_id,recipient_id) do
		where("(invites.sender_id = ? AND invites.recipient_id =?) OR (invites.sender_id = ? AND invites.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
	end
end
