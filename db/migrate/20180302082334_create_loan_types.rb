class CreateLoanTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_types do |t|
      t.string :name
      t.string :code
      t.string :interest_mode, default: "flat"
      t.decimal :rate, precision: 6, scale: 2
      t.string :repayment_method, default: "cheque/cash"

      t.timestamps
    end
  end
end
