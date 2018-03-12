class AddingFromInstallmentToAccountingEntries < ActiveRecord::Migration[5.1]
  def change

  		add_column :accounting_entries, :from_installment, :bigint
  end
end
