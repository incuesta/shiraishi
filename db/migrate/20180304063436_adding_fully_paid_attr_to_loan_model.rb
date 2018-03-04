class AddingFullyPaidAttrToLoanModel < ActiveRecord::Migration[5.1]
  def change
  		add_column :loans, :fully_paid, :boolean, default: false
  end
end
