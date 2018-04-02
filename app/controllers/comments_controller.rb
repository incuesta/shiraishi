class CommentsController < ApplicationController

	before_action :set_conversation, only: [:index, :create]
	


	def index
		@comments = @conversation.comments

		authorize Comment
	end



	def create
		@comments = @conversation.comments
		@comment = @conversation.comments.build(comment_params)
		@comment.commenter = pundit_user.id
		@comment.commenter_class = pundit_user.class

		authorize Comment

		respond_to do | format |
			if @comment.save

				if current_client
					format.html { redirect_to contacts_financing_index_path, notice: 'Comment Posted!' }
				else
					format.html { redirect_to conversation_comments_path(@conversation), notice: 'Comment Posted!' }
				end

				format.js { render "comments/client_comment" }
			end

		end
	end



	private

		def set_conversation
			@conversation = Conversation.find params[:conversation_id]
		end

		def comment_params
			params.require(:comment).permit(:body)
		end
end