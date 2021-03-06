# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal




class ClientProfile < ApplicationRecord

	belongs_to :client

	mount_uploader :image, ImageUploader


  	# Validation
	validates :address, presence: true
	validates :city, presence: true
	validates :zip_code, presence: true, length: { minimum: 4, maximum: 4 }, format: { with: /\A[+-]?\d+\z/ }
	validates :civil_status, presence: true
	validates :mobile, presence: true, length: { minimum: 11, maximum: 11 }, numericality: true
	validates :telephone, presence: true, length: { minimum: 7, maximum: 10 }, numericality: true
	validates :company, presence: true
	validates :employee_category, presence: true
	validates :job_title, presence: true
	validates :manager, presence: true
end
