class ChangeConversationSubjectDefaultValue < ActiveRecord::Migration[5.1]
  def change
  	change_column :conversations, :subject, :string, default: 'Inquiry'
  end
end
