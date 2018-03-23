class ReportPolicy < ApplicationPolicy

	def index?
		loan_officers_only
	end

  	def show?
  		loan_officers_only
 	end



	def activity_logs?
		loan_officers_only
	end



	def income_summary?
		loan_officers_only
	end




	 
	def requested_loans?
		loan_officers_only
	end




	def approved_loans?
		loan_officers_only
	end




	def rejected_loans?
		loan_officers_only
	end




	def disbursed_loans?
		loan_officers_only
	end




	def undisbursed_loans?
		loan_officers_only
	end


	private

		def loan_officers_only
  			@user.instance_of?(Admin) || @user.instance_of?(Accountant) || @user.instance_of?(LoanManager)
  		end
end