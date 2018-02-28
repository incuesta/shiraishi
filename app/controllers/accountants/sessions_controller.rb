# frozen_string_literal: true

class Accountants::SessionsController < Devise::SessionsController
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


  def after_sign_in_path_for(resource)
      # Create a Profile first
      if current_accountant.accountant_profile
        accountant_profile_path(current_accountant.accountant_profile)
      else
        new_accountant_profile_path
      end
  end
end
