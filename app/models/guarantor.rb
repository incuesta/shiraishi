class Guarantor < ApplicationRecord
	belongs_to :client

	mount_uploader :image, ImageUploader


	def full_name
		"#{last_name}, #{first_name} #{middle_name}"
	end
end
