class Comment < ApplicationRecord


	belongs_to :conversation

	# Find the poster
	def self.find_commenter(commenter_id, commenter_class)
		case commenter_class
			when UserClass.user_clases[:admin]
				Admin.find commenter_id
			when UserClass.user_classes[:loan_manager]
				LoanManager.find commenter_id
			when UserClass.user_classes[:accountant]
				Accountant.find commenter_id
			else
				Client.find commenter_id
		end
	end


	# Find using Commenter
	scope :find_by_commenter, lambda { |commenter_id, commenter_class|
		where commenter: commenter_id, commenter_class: commenter_class
	}
end
