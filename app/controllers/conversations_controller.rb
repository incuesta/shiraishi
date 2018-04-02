class ConversationsController < ApplicationController

	before_action :set_conversation, only: [:show, :destroy]


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