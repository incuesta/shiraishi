class Article < ApplicationRecord
	has_many :sections, dependent: :destroy


	mount_uploader :image, ImageUploader
end
