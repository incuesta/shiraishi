class AdminProfilePolicy < ApplicationPolicy

	def index?
		@user.instance_of? Admin
	end

	def show?
		@user.instance_of? Admin 
	end

	def new?
		@user.instance_of? Admin
	end

	def create?
		@user.instance_of? Admin 
	end

	def edit?
		@user.instance_of? Admin 
	end

	def update?
		@user.instance_of? Admin 
	end

	def destroy?
		@user.instance_of? Admin 
	end
end
