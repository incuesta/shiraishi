class AddFullyPaidAttrToLoanInstallmentContainer < ActiveRecord::Migration[5.1]
  def change
  		add_column :loan_installment_containers, :fully_paid, :boolean, default: false
  end
end
