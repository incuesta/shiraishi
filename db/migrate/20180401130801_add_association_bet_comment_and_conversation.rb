class AddAssociationBetCommentAndConversation < ActiveRecord::Migration[5.1]
  def change
  	add_reference :comments, :conversation
  end
end
