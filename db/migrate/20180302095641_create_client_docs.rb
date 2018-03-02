class CreateClientDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :client_docs do |t|
      t.string :name
      t.boolean :submitted, default: false

      t.timestamps
    end
  end
end
