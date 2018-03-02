class LoanDoc < ApplicationRecord

	has_many :loan_type_loan_docs
	has_many :loan_types, through: :loan_type_loan_docs
end
