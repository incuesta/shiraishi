class AddingAdditionalAttrToAdmin < ActiveRecord::Migration[5.1]
	  def change
	  		add_column :admins, :user_name, :string
	  		add_column :admins, :timezone, :string, default: "Singapore"
	  		add_column :admins, :enabled, :boolean, default: true
	  		add_column :admins, :last_name, :string
	  		add_column :admins, :first_name, :string
	  		add_column :admins, :middle_name, :string

	  		add_index :admins, :user_name, unique: true
	  end
end
