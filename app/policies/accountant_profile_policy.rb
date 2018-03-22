class AccountantProfilePolicy < ApplicationPolicy
  	

	def index?
		@user.instance_of?(Admin)
	end


	# Allow only Accountant to update his OWN
	def show?
		(@user.instance_of?(Accountant) && accountant_profile.accountant == @user) || @user.instance_of?(Admin)	
	end




	def new?
		@user.instance_of?(Accountant) || @user.instance_of?(Admin)	
	end

	def create?
		@user.instance_of?(Accountant) || @user.instance_of?(Admin)	
	end




	# Allow only Accountant to update his OWN
	def edit?
		(@user.instance_of?(Accountant) && accountant_profile.accountant == @user) || @user.instance_of?(Admin)	
	end

	# Allow only Accountant to update his OWN
	def update?
		(@user.instance_of?(Accountant) && accountant_profile.accountant == @user) || @user.instance_of?(Admin)	
	end




	# Allow only Accountant to update his OWN
	def destroy?
		(@user.instance_of?(Accountant) && accountant_profile.accountant == @user) || @user.instance_of?(Admin)	
	end



  	private

  		def accountant_profile
  			record
  		end
end
