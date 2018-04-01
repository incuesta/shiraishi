class CommentsController < ApplicationController

	before_action :set_conversation, only: [:create, :destroy]
	


	def create
		@comment = @conversation.comments.build(comment_params)

		respond_to do | format |
			if @comment.save
				format.html { redirect_to contacts_financing_index_path, notice: 'Comment Posted!' }
			end

		end
	end



	def destroy
	end


	private

		def set_conversation
			@conversation = Conversation.find params[:conversation_id]
		end

		def comment_params
			params.require(:comment).permit(:body)
		end
end