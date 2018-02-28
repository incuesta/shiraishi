class LoanManagerProfile < ApplicationRecord
  	belongs_to :loan_manager

  	mount_uploader :image, ImageUploader
end
