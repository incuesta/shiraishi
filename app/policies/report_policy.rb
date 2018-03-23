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


end