class AddSubjectToConversation < ActiveRecord::Migration[5.1]
  def change
  	add_column :conversations, :subject, :string
  end
end
