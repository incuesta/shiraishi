class Loan < ApplicationRecord
	belongs_to :client
	belongs_to :loan_type
	
end
