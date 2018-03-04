class LoanInstallmentContainer < ApplicationRecord
	has_many :loan_installments, dependent: :destroy


	
end
