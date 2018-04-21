# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal


class LoanInstallment < ApplicationRecord
	belongs_to :loan_installment_container


	# Loan installment Contant
	def self.states
		{paid: 'paid', unpaid: 'unpaid'}
	end

	def self.overdued_installments
		where("'to' < :now and state = :state", {now: Date.current.yesterday, state: self.states[:unpaid]} )
	end
end
