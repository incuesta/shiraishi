# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal


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
			if !@conversation.is_close && @comment.save

				if current_client
					format.html { redirect_to contacts_financing_index_path, notice: 'Comment Posted!' }
				else
					format.html { redirect_to conversation_comments_path(@conversation), notice: 'Comment Posted!' }
				end

				format.js { render "comments/client_comment" }
			else
				format.js { render "comments/unable_to_comment" }
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