# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class ActivityLog < ApplicationRecord

	# User Class Constant
	def self.user_class
		{admin: 'Admin', loan_manager: 'LoanManager', accountant: 'Accountant', client: 'Client'}
	end


	def self.find_user(user_class, user_id)
		case user_class
			when self.user_class[:admin]
				Admin.find user_id
			when self.user_class[:loan_manager]
				LoanManager.find user_id
			when self.user_class[:accountant]
				Accountant.find user_id
			else
				Client.find user_id
		end
	end
end
