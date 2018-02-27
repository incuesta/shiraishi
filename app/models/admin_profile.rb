class AdminProfile < ApplicationRecord

		# Admin (1:1) AdminProfile
		belongs_to :admin



		# CarrierWave Uploader
		mount_uploader :image, ImageUploader



		# Validation
		validates :address, presence: true
		validates :city, presence: true
		validates :zip_code, presence: true, length: { minimum: 4, maximum: 4 }, format: { with: /\A[+-]?\d+\z/ }
		validates :civil_status, presence: true
		validates :mobile, presence: true, length: { minimum: 11, maximum: 11 }, numericality: true
		validates :company, presence: true
		validates :employee_category, presence: true
		validates :job_title, presence: true
		validates :manager, presence: true


end