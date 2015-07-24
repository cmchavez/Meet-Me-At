class Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.invitation.subject
  #
  def emailinvitation(emailinvitation, new_user_path)
    @greeting = "Hello, your friend has invited you to join our app"

    mail to: emailinvitation.recipient_email, subject: "Join Meetme@", from: "meetmeatthisplace2015@gmail.com"
    emailinvitation.update_attribute(:sent_at, Time.now)
  end

end
