class CommentPolicy < ApplicationPolicy


	def index?
		loan_officers_only
	end


	def create?
		@user.present? && has_profile?
	end


end