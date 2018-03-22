class ClientProfilePolicy < ApplicationPolicy
  	

	def index?
		loan_officers_only
	end


	# Allow only Client to update his OWN
	def show?
		(@user.instance_of?(Client) && client_profile.client == @user) || loan_officers_only
	end




	def new?
		@user.instance_of?(Client) || loan_officers_only
	end

	def create?
		@user.instance_of?(Client) || loan_officers_only
	end




	# Allow only Client to update his OWN
	def edit?
		(@user.instance_of?(Client) && client_profile.client == @user) || loan_officers_only
	end

	# Allow only Client to update his OWN
	def update?
		(@user.instance_of?(Client) && client_profile.client == @user) || loan_officers_only
	end




	# Allow only Client to update his OWN
	def destroy?
		loan_officers_only
	end



  	private

  		def client_profile
  			record
  		end

  		def loan_officers_only
  			@user.instance_of?(Admin) || @user.instance_of?(Accountant) || @user.instance_of?(LoanManager)
  		end
end
