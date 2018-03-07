class Loan < ApplicationRecord
	belongs_to :client
	belongs_to :loan_type


	# This list the Documents that have been submitted thus far
	has_many :submitted_docs, dependent: :destroy	# Join Table
	has_many :loan_docs, through: :submitted_docs


	# In association to LoanInstallmentContainer
	has_one :loan_installment_container, dependent: :destroy





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





	# Loan Status Constant
	def self.statuses
		{draft: 'draft', rejected: 'rejected', approved: 'approved', disbursed: 'disbursed'}
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
