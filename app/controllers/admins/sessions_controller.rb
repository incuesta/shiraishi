# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal




# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    record current_admin, "Signed In"
  end

  # DELETE /resource/sign_out
  def destroy
    admin = current_admin
    super
    record admin, "Signed Out"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  # redirect to a specific page after signing in
  def after_sign_in_path_for(resource)
      # Create a Profile First
      if current_admin.admin_profile
        admin_profile_path(current_admin.admin_profile)
      else
        new_admin_profile_path
      end
  end
end
