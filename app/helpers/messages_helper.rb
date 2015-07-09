module MessagesHelper
	def self_or_other(message)
		message.user == current_user ? "self" : "other"
	end

	def message_interlocutor(message)
		message.user == message.invite.sender ? message.invite.sender : message.invite.recipient
	end
end
