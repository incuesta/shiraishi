class CreateLoanInstallments < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_installments do |t|
      t.integer :installment_no
      t.string :client
      t.datetime :from
      t.datetime :to
      t.decimal :principal_amount, precision: 11, scale: 2
      t.decimal :interest_amount, precision: 11, scale: 2
      t.decimal :emi_installment, precision: 11, scale: 2
      t.string :state, default: "unpaid"
      t.text :notes

      t.timestamps
    end
  end
end
