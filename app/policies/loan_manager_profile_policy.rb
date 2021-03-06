# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class LoanManagerProfilePolicy < ApplicationPolicy
  	

	def index?
		@user.instance_of?(Admin)
	end


	# Allow only LoanManger to update his OWN
	def show?
		(@user.instance_of?(LoanManager) && loan_manager_profile.loan_manager == @user) || @user.instance_of?(Admin)	
	end




	def new?
		@user.instance_of?(LoanManager) || @user.instance_of?(Admin)	
	end

	def create?
		@user.instance_of?(LoanManager) || @user.instance_of?(Admin)	
	end




	# Allow only LoanManger to update his OWN
	def edit?
		(@user.instance_of?(LoanManager) && loan_manager_profile.loan_manager == @user) || @user.instance_of?(Admin)	
	end

	# Allow only LoanManger to update his OWN
	def update?
		(@user.instance_of?(LoanManager) && loan_manager_profile.loan_manager == @user) || @user.instance_of?(Admin)	
	end




	# Allow only LoanManger to update his OWN
	def destroy?
		(@user.instance_of?(LoanManager) && loan_manager_profile.loan_manager == @user) || @user.instance_of?(Admin)	
	end



  	private

  		def loan_manager_profile
  			record
  		end
end
