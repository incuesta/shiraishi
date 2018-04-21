# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class ConversationPolicy < ApplicationPolicy


	def index?
		loan_officers_only
	end


	def create?
		@user.present? && has_profile?
	end

	def destroy?
		@user.instance_of?(Admin)
	end

end