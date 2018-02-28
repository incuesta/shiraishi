class AddExtraAttrToClientsRegistration < ActiveRecord::Migration[5.1]
	  def change

	  		add_column :clients, :user_name, :string
	  		add_column :clients, :timezone, :string, default: "Singapore"
	  		add_column :clients, :enabled, :boolean, default: false
	  		add_column :clients, :last_name, :string
	  		add_column :clients, :first_name, :string
	  		add_column :clients, :middle_name, :string

	  		add_index :clients, :user_name, unique: true
	  end
end
