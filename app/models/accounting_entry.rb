class AccountingEntry < ApplicationRecord
	belongs_to :loan

	has_many :dr_entries, dependent: :destroy
	has_many :cr_entries, dependent: :destroy

end
