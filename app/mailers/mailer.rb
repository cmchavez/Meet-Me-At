class Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.invitation.subject
  #
  def emailinvitation(emailinvitation, new_user_path)
    subject 'Invitation'
    recipients emailinvitation.recipient_mail
    from 'meetmeatthisplace2015@gmail.com'
    body :invitation => invitation, :new_user_path => new_user_path
    invitation.update_attribute(:sent_at, Time.now)
  end

end
