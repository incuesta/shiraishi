class CreateCrEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :cr_entries do |t|
      t.references :accounting_entry, foreign_key: true
      t.string :description
      t.decimal :value

      t.timestamps
    end
  end
end
