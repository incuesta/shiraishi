class DataStorePolicy < ApplicationPolicy

	def scheduled_backup?
		@user.instance_of?(Admin)
 	end


 	def manual_backup?
 		@user.instance_of?(Admin)
 	end


 	private

  		def loan_officers_only
  			@user.instance_of?(Admin) || @user.instance_of?(Accountant) || @user.instance_of?(LoanManager)
  		end
end