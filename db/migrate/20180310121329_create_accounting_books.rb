class CreateAccountingBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :accounting_books do |t|
      t.references :loan, foreign_key: true
      t.string :name
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
