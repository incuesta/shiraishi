# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class GoldenKeyPolicy < ApplicationPolicy
  	

	# Policy for AccountActivationsController

	def index?
		loan_officers_only
	end


	def show?
		loan_officers_only
	end




	def new?
		loan_officers_only
	end

	def create?
		loan_officers_only
	end




	def edit?
		loan_officers_only
	end

	def update?
		loan_officers_only
	end




	def destroy?
		loan_officers_only
	end


end
