class AccountingBook < ApplicationRecord
	belongs_to :loan

	has_many :accounting_entries, dependent: :destroy
  


	# title (string)
	# principal_balance (decimal)
	# interest_income_balance (decimal)
	# description (string)
	def create_entry(options = {title: '', description: '', principal_balance: 0, interest_income_balance: 0, from_installment: nil })

			accounting_entry = accounting_entries.build()
            accounting_entry.title = options[:title]
            accounting_entry.entry_date = Date.current
            accounting_entry.principal_balance = options[:principal_balance]
            accounting_entry.interest_income_balance = options[:interest_income_balance]
            accounting_entry.description = options[:description]
            accounting_entry.from_installment =options[:from_installment]
            accounting_entry.save
            accounting_entry

	end


end
