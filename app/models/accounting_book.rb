class AccountingBook < ApplicationRecord
  belongs_to :loan

  has_many :accounting_entries, dependent: :destroy
end
