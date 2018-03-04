class AddLoanInstallmentContainerAndLoanInstallmentAssoc < ActiveRecord::Migration[5.1]
  def change
  		add_reference :loan_installments, :loan_installment_container, foreign_key: true
  end
end
