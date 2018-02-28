class AddAccountantsExtraAttr < ActiveRecord::Migration[5.1]
	  def change

	  		add_column :accountants, :user_name, :string
	  		add_column :accountants, :timezone, :string, default: "Singapore"
	  		add_column :accountants, :enabled, :boolean, default: false
	  		add_column :accountants, :last_name, :string
	  		add_column :accountants, :first_name, :string
	  		add_column :accountants, :middle_name, :string

	  		add_index :accountants, :user_name, unique: true
	  end
end
