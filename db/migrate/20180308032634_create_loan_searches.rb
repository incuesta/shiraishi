class CreateLoanSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_searches do |t|
      t.string :string_id
      t.string :client_last_name
      t.string :client_first_name
      t.string :client_middle_name
      t.bigint :loan_type_id
      t.datetime :application_date
      t.datetime :approved_date
      t.datetime :disbursement_date
      t.string :loan_status
      t.boolean :fully_paid

      t.timestamps
    end
  end
end
