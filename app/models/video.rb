# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class Video < ApplicationRecord
	acts_as_list

	validates :video_id, presence: true
	validates :host, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :tags, presence: true
end
