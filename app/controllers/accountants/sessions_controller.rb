# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal



# frozen_string_literal: true

class Accountants::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    record current_accountant, "Signed In"
  end

  # DELETE /resource/sign_out
  def destroy
    accountant = current_accountant
    super
    record accountant, "Signed Out"
  end

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
