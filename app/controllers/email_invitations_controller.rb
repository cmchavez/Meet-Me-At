class EmailInvitationsController < ApplicationController
  def new
  	@emailinvitation = EmailInvitation.new
  end

  def create
  end
end
