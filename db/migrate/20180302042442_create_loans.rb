class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.string :string_id
      t.datetime :application_date
      t.datetime :approved_date
      t.datetime :disbursement_date
      t.string :status
      t.decimal :principal_amount, precision: 8, scale: 2
      t.datetime :from
      t.datetime :to
      t.decimal :principal_amount, precision: 8, scale: 2
      t.decimal :net_loan, precision: 8, scale: 2
      t.decimal :net_interest, precision: 8, scale: 2
      t.text :notes

      t.timestamps

      t.index [:string_id], name: :index_loans_on_string_id, unique: true
    end
  end
end
