# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal


class LoanDoc < ApplicationRecord

	has_many :loan_type_loan_docs
	has_many :loan_types, through: :loan_type_loan_docs


	# This list the Documents that have been submitted thus far
	has_many :submitted_docs, dependent: :destroy	# Join Table
	has_many :loans, through: :submitted_docs


	validates :name, presence: true
end
