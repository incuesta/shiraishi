class SubmittedDoc < ApplicationRecord
  belongs_to :loan
  belongs_to :loan_doc
end
