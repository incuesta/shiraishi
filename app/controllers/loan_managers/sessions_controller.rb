# frozen_string_literal: true

class LoanManagers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # redirect to a specific page after signing in
  def after_sign_in_path_for(resource)
      # Create a profile first
      if current_loan_manager.loan_manager_profile
        loan_manager_profile_path(current_loan_manager.loan_manager_profile)
      else
        new_loan_manager_profile_path
      end
  end
end
