# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class LoanMailer < ApplicationMailer

	  # Subject can be set in your I18n file at config/locales/en.yml
	  # with the following lookup:
	  #
	  #   en.loan_mailer.new_loan_notification.subject
	  #
	  def new_loan_notification
	    @greeting = "Hi"

	    mail to: "to@example.org"
	  end


	  def new_delinquent_notification(loan)
	  		@loan = loan
	  		@client = loan.client
	  		@email = @client.email

	  		mail to: @email
	  end


	  # Send this when loan is approved
	  def new_approved_loan(loan)
	  		@loan = loan
	  		@client = loan.client
	  		@email = @client.email

	  		mail to: @email
	  end


	  # Send this when loan is disbursed
	  def new_disbursed_loan(loan)
	  		@loan = loan
	  		@loan_docs = @loan.loan_type.loan_docs
	  		@client = loan.client
	  		@email = @client.email

	  		mail to: @email
	  end


	  # Send this when loan is rejected
	  def new_rejected_loan(loan)
	  		@loan = loan
	  		@client = loan.client
	  		@email = @client.email

	  		mail to: @email
	  end


	  # Send this when loan is approved
	  def new_payment_notification(loan, amount)
	  		@amount = amount
	  		@loan = loan
	  		@client = loan.client
	  		@email = @client.email

	  		mail to: @email
	  end
end
