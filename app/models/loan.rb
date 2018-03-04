class Loan < ApplicationRecord
	belongs_to :client
	belongs_to :loan_type


	# Loan Status Constant
	def self.statuses
		{draft: 'draft', rejected: 'rejected', approved: 'approved', disbursed: 'disbursed'}
	end
	
end
