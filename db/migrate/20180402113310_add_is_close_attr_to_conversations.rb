class AddIsCloseAttrToConversations < ActiveRecord::Migration[5.1]
  def change
  	add_column :conversations, :is_close, :boolean, default: false
  end
end
