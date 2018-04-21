# 2018-04-21

# Title:
#     Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#     Leopoldo Deogenes P. Cuesta II
#     BS-IT Student
#     AMA Computer University, College of East Rizal



class AccountingEntry < ApplicationRecord
	belongs_to :accounting_book

	has_many :dr_entries, dependent: :destroy
	has_many :cr_entries, dependent: :destroy






    # description (String)
    # value (decimal)
    def create_dr_entry(options = {})
    	dr = dr_entries.build()
    	dr.description = options[:description]
    	dr.value = options[:value]
    	dr.save
    	dr
    end



    # description (String)
    # value (decimal)
    def create_cr_entry(options = {})
    	cr = cr_entries.build()
    	cr.description = options[:description]
    	cr.value = options[:value]
    	cr.save
    	cr
    end
end
