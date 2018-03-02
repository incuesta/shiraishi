class ChangePrecisionOfLoan < ActiveRecord::Migration[5.1]
  def change

    change_column :loans, :principal_amount, :decimal, precision: 11, scale: 2
    change_column :loans, :net_loan, :decimal, precision: 11, scale: 2
    change_column :loans, :net_interest, :decimal, precision: 11, scale: 2
  end
end
