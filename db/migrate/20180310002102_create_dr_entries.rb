class CreateDrEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :dr_entries do |t|
      t.references :accounting_entry, foreign_key: true
      t.string :description
      t.decimal :value

      t.timestamps
    end
  end
end
