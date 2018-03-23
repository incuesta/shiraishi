class SectionPolicy < ApplicationPolicy
 	

 	def index?
	    loan_officers_only
	end

	def show?
	    loan_officers_only
	end




	def create?
	    loan_officers_only
	end

	def new?
	    loan_officers_only
	end



	def update?
	    loan_officers_only
	end

	def edit?
	    loan_officers_only
	end




	def destroy?
	    loan_officers_only
	end




	private

		def section
			record
		end

		def loan_officers_only
  			@user.instance_of?(Admin) || @user.instance_of?(Accountant) || @user.instance_of?(LoanManager)
  		end
end