# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal



class VideoPolicy < ApplicationPolicy

	def index?
	    @user.instance_of?(Admin)
	end

	def show?
	    @user.instance_of?(Admin)
	end

	def create?
	    @user.instance_of?(Admin)
	end

	def new?
	    @user.instance_of?(Admin)
	end

	def update?
	    @user.instance_of?(Admin)
	end

	def edit?
	    @user.instance_of?(Admin)
	end

	def destroy?
	    @user.instance_of?(Admin)
	end
end