class CreateLoanTypeLoanDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_type_loan_docs do |t|
      t.references :loan_type, foreign_key: true
      t.references :loan_doc, foreign_key: true
      t.boolean :compulsory, default: false

      t.timestamps
    end
  end
end
