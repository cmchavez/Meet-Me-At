class Message < ActiveRecord::Base
  belongs_to :invite
  belongs_to :user

  validates_presence_of :description, :invite_id, :user_id
end
