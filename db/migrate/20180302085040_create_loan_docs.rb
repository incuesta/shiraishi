class CreateLoanDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_docs do |t|
      t.string :name
      t.boolean :compulsory, default: true

      t.timestamps
    end
  end
end
