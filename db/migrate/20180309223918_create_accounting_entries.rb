class CreateAccountingEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :accounting_entries do |t|
      t.references :loan, foreign_key: true
      
      t.string :title
      t.datetime :entry_date
      t.decimal :principal_balance
      t.decimal :interest_income_balance
      t.string :description

      t.timestamps
    end
  end
end
