class LoanInstallment < ApplicationRecord
	belongs_to :loan_installment_container


	# Loan installment Contant
	def self.states
		{paid: 'paid', unpaid: 'unpaid'}
	end
end
