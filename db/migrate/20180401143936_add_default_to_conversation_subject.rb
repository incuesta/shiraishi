class AddDefaultToConversationSubject < ActiveRecord::Migration[5.1]
  def change
  	change_column :conversations, :subject, :string, default: 'My New Conversation'
  end
end
