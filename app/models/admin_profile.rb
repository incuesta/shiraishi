class AdminProfile < ApplicationRecord

		# Admin (1:1) AdminProfile
		belongs_to :admin
end
