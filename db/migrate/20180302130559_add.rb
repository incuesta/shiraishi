class Add < ActiveRecord::Migration[5.1]
  def change
  		# Added some min and max amount for LoanType

  		add_column :loan_types, :minimum, :decimal, precision: 11, scale: 2
  		add_column :loan_types, :maximum, :decimal, precision: 11, scale: 2

  end
end
