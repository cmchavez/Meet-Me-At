require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "emailinvitation" do
    mail = Mailer.emailinvitation
    assert_equal "Emailinvitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
