# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal


class Clients::AccountActivationsController < ApplicationController


	# This is just for Activating or Banning an AccountActivationsController


  	def index
  		@clients = Client.all
      authorize GoldenKey, :index? # PUndit Policy
  	end

  	def show
  	end

  	def edit
  	end

  	def update
      # When the checkbox is checked activate the account
      # This is using AJAX
  		golden_key = GoldenKey.find(params[:id])
  		golden_key.update(enabled: params[:is_enabled])

  	end
end
