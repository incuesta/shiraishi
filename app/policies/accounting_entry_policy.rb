# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal


class AccountingEntryPolicy < ApplicationPolicy



	def index?
	  	@user.instance_of?(Admin)
	end

	def show?
	  	@user.instance_of?(Admin)
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
		@user.instance_of?(Admin)
	end




	# Shows the journal of all loans
	def show_all_loan_entries?
	    loan_officers_only
	end


  	# Shows income summary
  	def show_income_summary?
    	loan_officers_only
  	end


	private

		def accounting_entry
			record
		end

end
