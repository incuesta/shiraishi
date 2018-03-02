class AddAssociationToLoanTypesAndLoan < ActiveRecord::Migration[5.1]
  def change
  	add_reference :loans, :loan_type, foreign_key: true
  end
end
