class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.references :article, foreign_key: true
      t.string :image
      t.text :body

      t.timestamps
    end
  end
end
