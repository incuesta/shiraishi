class Section < ApplicationRecord
  	belongs_to :article


  	mount_uploader :image, ImageUploader


  	acts_as_list scope: :article
end
