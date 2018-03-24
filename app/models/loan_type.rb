class LoanType < ApplicationRecord
	has_many :loan

	has_many :loan_type_loan_docs
	has_many :loan_docs, through: :loan_type_loan_docs

	# validates :name, presence: true
	# validates :code, presence: true
	# validates :rate, presence: true, numericality: true
	# validates :minimum, presence: true
	# validates :maximum, presence: true, numericality: true
	# validates :duration, presence: true, numericality: true
end
