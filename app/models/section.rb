# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal


class Section < ApplicationRecord
  	belongs_to :article


  	mount_uploader :image, ImageUploader


  	acts_as_list scope: :article
end
