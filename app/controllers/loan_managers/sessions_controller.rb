# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal



# frozen_string_literal: true

class LoanManagers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    record current_loan_manager, "Signed In"
  end

  # DELETE /resource/sign_out
  def destroy
    loan_manager = current_loan_manager
    super
    record loan_manager, "Signed Out"
  end

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
