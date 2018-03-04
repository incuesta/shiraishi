class CreateLoanInstallmentContainers < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_installment_containers do |t|

      t.timestamps
    end
  end
end
