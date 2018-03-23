class LoanPolicy < ApplicationPolicy


	def index?
		loan_officers_only
	end

	def requested_loans?
		loan_officers_only
	end

	def approved_loans?
		loan_officers_only
	end

	def approved_loans_for_disbursion?
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

	def red_listed_loans?
		loan_officers_only
	end

	def show_loan_disbursion?
		loan_officers_only
	end

	def show_accounting_for_loan?
		loan_officers_only
	end

	def compute_installments?
		loan_officers_only
	end

	def approve_the_loan?
		loan_officers_only
	end

	def reject_the_loan?
		loan_officers_only
	end

	def disburse_the_loan?
		loan_officers_only
	end

	def update_submitted_docs?
		loan_officers_only
	end


	def show?
		(loan.client == @user) || loan_officers_only
	end

	def new?
		@user.present? && has_profile?
	end

	def create?
		@user.present? && has_profile?
	end

	def edit?
		@user.present? 
	end

	def update?
		@user.present?
	end

	def destroy?
		loan_officers_only
	end


	private


		def loan
			record
		end


end