class ConversationsController < ApplicationController

	def create
		@conversation = current_client.conversations.build(conversation_params)

		respond_to do | format |
			if @conversation.save
				format.js { render 'conversations' }
				format.html { redirect_to contacts_financing_index_path, notice: 'Conversation started!' }
			end
		end
	end


	def destroy
	end


	private

		def set_conversation
			@conversation = Conversation.find(params[:id])
		end

		def conversation_params
			params.require(:conversation).permit(:subject)
		end
end