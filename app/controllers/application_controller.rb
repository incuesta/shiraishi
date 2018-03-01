class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception


  	include Pundit

	
	def pundit_user
		if current_admin
			current_admin
		elsif current_loan_manager
			current_loan_manager
		elsif current_accountant
			current_accountant
		elsif current_client
			current_client
		else
			nil
		end
	end

	# Alias because Pundit uses the current_method name
	#alias_method :current_user, :the_users
  
  


  	rescue_from Pundit::NotAuthorizedError, with: :yah_not_authorized_brother

	def yah_not_authorized_brother
	  	redirect_to request.referrer || root_path, notice: "You're not authorized to do that"
	end



end
