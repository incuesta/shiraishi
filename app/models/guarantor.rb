# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal


class Guarantor < ApplicationRecord
	belongs_to :client

	mount_uploader :image, ImageUploader


	def full_name
		"#{last_name}, #{first_name} #{middle_name}"
	end
end
