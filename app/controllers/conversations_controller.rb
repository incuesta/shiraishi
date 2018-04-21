# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class ConversationsController < ApplicationController

	before_action :set_conversation, only: [:show, :close_conversation, :destroy]


	def index
		@conversations = Conversation.order("created_at desc")

		authorize Conversation
	end



	def create
		@conversation = current_client.conversations.build(conversation_params)

		authorize Conversation

		respond_to do | format |
			if @conversation.save
				format.js { render 'conversations' }
				format.html { redirect_to contacts_financing_index_path, notice: 'Conversation started!' }
			end
		end
	end


	# This uses AJAXY PATCH from a check box
	def close_conversation
		@conversation.update(is_close: params[:is_close])

		respond_to do | format |
			format.js { render 'close_conversation' }
		end
	end


	def destroy
		@conversation.destroy

		authorize Conversation

		respond_to do | format |
			format.js {}
			format.html { redirect_to conversations_path, notice: 'Conversation Deleted!' }
		end 
	end


	private

		def set_conversation
			@conversation = Conversation.find(params[:id])
		end

		def conversation_params
			params.require(:conversation).permit(:subject)
		end
end