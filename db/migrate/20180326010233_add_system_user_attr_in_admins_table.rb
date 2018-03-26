class AddSystemUserAttrInAdminsTable < ActiveRecord::Migration[5.1]
	  def change
	  		add_column :admins, :is_system, :boolean, default: false
	  end
end
