class AddDurationToLoanTypes < ActiveRecord::Migration[5.1]
  def change

  	add_column :loan_types, :duration, :integer, default: 12
  end
end
