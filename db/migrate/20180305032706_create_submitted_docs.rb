class CreateSubmittedDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :submitted_docs do |t|
      t.references :loan, foreign_key: true
      t.string :name
      t.boolean :submitted, default: true
      t.timestamps
    end
  end
end
