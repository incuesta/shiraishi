class ChangeAccountingEntriesLoanIdToAccountingBookId < ActiveRecord::Migration[5.1]
  def change
  	 add_reference :accounting_entries, :accounting_book, foreign_key: true
  	 
  	 remove_column :accounting_entries, :loan_id

  end
end
