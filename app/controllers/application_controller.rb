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

	def yah_not_authorized_brother(exception)
		policy_name = exception.policy.class.to_s.underscore

	   	flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default

	  	redirect_to request.referrer || root_path
	end




	# Audit Trail!!!!
	def record(user, note)
		log 					= ActivityLog.new
		log.user_id 			= user.id
		log.user_class 			= user.class.name
		
		log.user_name	 		= user.user_name
		log.email 				= user.email
		
		log.last_name 			= user.last_name
		log.first_name 			= user.first_name
		log.middle_name 		= user.middle_name
		
		log.sign_in_count 		= user.sign_in_count
		log.current_sign_in_at 	= user.current_sign_in_at
		log.last_sign_in_at 	= user.last_sign_in_at
		log.current_sign_in_ip 	= user.current_sign_in_ip
		log.last_sign_in_ip 	= user.last_sign_in_ip
		log.browser 			= request.env["HTTP_USER_AGENT"]
		
		log.controller 			= controller_name
		log.action 				= action_name
		log.params 				= params.inspect
		
		log.note 				= note
		log.save
	end



	# Clients uses Public Layout
	def resolve_layout
      if current_admin || current_loan_manager || current_accountant
        'application'
      else
        'public'  # show Public Layout to Client
      end
    end
 	
end
