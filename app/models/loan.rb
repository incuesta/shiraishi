class Loan < ApplicationRecord
	belongs_to :client
	belongs_to :loan_type


	# This list the Documents that have been submitted thus far
	has_many :submitted_docs, dependent: :destroy	# Join Table
	has_many :loan_docs, through: :submitted_docs


	# In association to LoanInstallmentContainer
	has_one :loan_installment_container, dependent: :destroy





	# Loan Status Constant
	def self.statuses
		{draft: 'draft', rejected: 'rejected', approved: 'approved', disbursed: 'disbursed'}
	end




	# Scopes
	scope :list_loans, lambda { | status=nil | 
		(where(status: status) unless status.nil?) || all
	}



	scope :list_with_loan_type_and_client, lambda { 
		joins(:loan_type, :client)
	}



	scope :requested_loans, lambda { where status: 'draft' }
	scope :approved_loans, lambda { where status: 'approved' }
	scope :rejected_loans, lambda { where status: 'rejected' }
	scope :disbursed_loans, lambda { where status: 'disbursed' }
	scope :undisbursed_loans, lambda { where ["status='draft' or status='approved' or status='rejected'"] }




	# This is for the Simple Search
	# Search field that queries multiple columns
	def self.simple_search(search_string)

		search_string = search_string.downcase


		the_day = Date.parse(search_string) rescue nil


		if the_day
			start_day = the_day.beginning_of_day
			end_day = the_day.end_of_day
		end


		date_query = ("or application_date between :start and :end" if the_day) || ""
		date_values = {start: start_day, end: end_day} if the_day || {}


		list_with_loan_type_and_client.where("lower(string_id) like :string_id or 
			lower(status) like :loan_status or 
			lower(clients.last_name) like :last_name  or 
			lower(loan_types.name) like :type_name 
			#{date_query}", 
			{
				string_id: "#{search_string}%", 
				loan_status: "#{search_string}%", 
				loan_notes: "#{search_string}%", 
				type_name: "#{search_string}%", 
				last_name: "#{search_string}%"
			}.merge(date_values) )
	end





	 # Generates String ID of a Loan
	def self.identification_string(client)
		"LOAN-#{ '%03d' % [client.id]}#{Time.zone.now.to_i}" if client
	end

	


	# Returns true if the Loan requisites are met
	def evaluate_request
		principal_amt = principal_amount
	    minimum = loan_type.minimum
	    maximum = loan_type.maximum

	    required_documents = loan_type.loan_docs.sort
	    submitted_documents = loan_docs.sort unless loan_docs.nil?


	    (principal_amt >= minimum && principal_amt <= maximum) && required_documents == submitted_documents
	end

	
end
