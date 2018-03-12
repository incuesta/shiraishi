class OverallPrincipalAndInterestBalanceForAccountingBooks < ActiveRecord::Migration[5.1]
  def change
  		add_column :accounting_books, :overall_principal_balance, :decimal, precision: 11, scale: 2
  		add_column :accounting_books, :overall_interest_balance, :decimal, precision: 11, scale: 2
  end
end
