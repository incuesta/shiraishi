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
