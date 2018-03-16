require 'test_helper'

class LoanMailerTest < ActionMailer::TestCase
  test "new_loan_notification" do
    mail = LoanMailer.new_loan_notification
    assert_equal "New loan notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
