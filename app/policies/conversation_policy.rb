class ConversationPolicy < ApplicationPolicy


	def index?
		loan_officers_only
	end


	def create?
		@user.present? && has_profile?
	end

	def destroy?
		@user.instance_of?(Admin)
	end

end