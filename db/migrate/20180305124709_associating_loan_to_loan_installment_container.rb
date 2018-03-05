class AssociatingLoanToLoanInstallmentContainer < ActiveRecord::Migration[5.1]
  def change

  		add_reference :loan_installment_containers, :loan, foreign_key: true
  end
end
