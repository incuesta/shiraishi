class LoanTypeLoanDoc < ApplicationRecord
  belongs_to :loan_type
  belongs_to :loan_doc
end
