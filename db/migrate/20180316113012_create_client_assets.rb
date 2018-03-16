class CreateClientAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :client_assets do |t|
    	t.references :client, foreign_key: true
	    t.string :image
	    t.string :name
	    t.text :description

	    t.timestamps
    end
  end
end
