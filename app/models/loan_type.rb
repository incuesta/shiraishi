class LoanType < ApplicationRecord
	has_many :loan

	has_many :loan_type_loan_docs
	has_many :loan_docs, through: :loan_type_loan_docs
end
