class CreateGoldenKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :golden_keys do |t|
      t.references :client, foreign_key: true
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
