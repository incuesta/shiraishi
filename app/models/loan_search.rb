class LoanSearch < ApplicationRecord


	#
	def loans
		@loans = search_loans
	end


	# Advance Search Loan
	def search_loans
		loans = Loan.list_with_loan_type_and_client.order("approved_date desc")
		


		loans = loans.where "lower(string_id) like string_id", {string_id: "#{string_id}%"} if string_id.present?
		
		loans = loans.where "lower(clients.last_name) like :last_name", {last_name: "#{client_last_name}%"} if client_last_name.present?
		loans = loans.where "lower(clients.first_name) like :first_name", {first_name: "#{client_first_name}%"} if client_first_name.present?
		loans = loans.where "lower(clients.middle_name) like :middle_name", {middle_name: "#{client_middle_name}%"} if client_middle_name.present?
		
		loans = loans.where loan_type_id: "#{loan_type_id}" if loan_type_id.present?
		
		loans = loans.where "application_date > :application_date", {application_date: "#{application_date.tomorrow}"} if application_date.present?
		loans = loans.where "approved_date > :approved_date", {approved_date: "#{approved_date.tomorrow}"} if approved_date.present?
		loans = loans.where "disbursement_date > :disbursement_date", {disbursement_date: "#{disbursement_date.tomorrow}"} if disbursement_date.present?
	
		loans = loans.where "lower(loan_status) like :loan_status", {loan_status: "#{loan_status}%"} if loan_status.present?



		loans
	end


end
