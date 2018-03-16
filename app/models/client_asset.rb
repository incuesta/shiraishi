class ClientAsset < ApplicationRecord
	belongs_to :client

	mount_uploader :image, ImageUploader
end
