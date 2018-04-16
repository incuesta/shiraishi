class AddSessionLimitableToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :unique_session_id, :string, limit: 20
  end
end
