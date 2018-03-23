class AdminProfilePolicy < ApplicationPolicy

	def index?
		@user.instance_of? Admin
	end

	def show?
		@user.instance_of?(Admin)  && admin_profile.admin == @user
	end

	def new?
		@user.instance_of? Admin
	end

	def create?
		@user.instance_of? Admin 
	end

	def edit?
		@user.instance_of?(Admin) && admin_profile.admin == @user
	end

	def update?
		@user.instance_of?(Admin) && admin_profile.admin == @user
	end

	def destroy?
		@user.instance_of?(Admin) && admin_profile.admin == @user
	end


	private
		def admin_profile
			record
		end
end
