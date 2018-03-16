# Preview all emails at http://localhost:3000/rails/mailers/loan_mailer
class LoanMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loan_mailer/new_loan_notification
  def new_loan_notification
    LoanMailer.new_loan_notification
  end


  def new_approved_loan
  	LoanMailer.new_approved_loan Loan.last
  end


  def new_disbursed_loan
  	LoanMailer.new_disbursed_loan Loan.last
  end


  def new_rejected_loan
  	LoanMailer.new_rejected_loan Loan.last
  end


end
