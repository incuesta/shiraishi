# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal




class Client < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable



	  has_one :client_profile, dependent: :destroy

    has_one :golden_key, dependent: :destroy # the Model to Enable or disable an Account

    

    has_many :loans, dependent: :destroy 


    has_many :guarantors, dependent: :destroy
    has_many :client_assets, dependent: :destroy


    has_many :conversations



	# Validation
    validates :user_name, presence: true, uniqueness: true
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :middle_name, presence: true



    def full_name
    	"#{last_name.capitalize}, #{first_name.capitalize} #{middle_name.capitalize}"
    end



    # Unactivated account. Activate first before being able to use.
    def active_for_authentication?
        super && self.golden_key.enabled?
    end


    # Uncomment this if you want Email to be unique among all User Classes

      # validate :email_already_in_used

      # def email_exists?(email_add)
      #   admins = Admin.where email: email_add
      #   loan_managers = LoanManager.where email: email_add
      #   accountants = Accountant.where email: email_add
      #   clients = Client.where email: email_add

      #   count = (admins + loan_managers + accountants + clients).count
      #   count > 0
      # end


      # def email_already_in_used
      #   if email_exists? email
      #     errors[:base] << "Email is already in used"
      #   end
      # end


      # # Uncomment this if you want unique User Names accross User Classes

      # validate :user_name_already_in_used

      # def user_name_exists?(usn)
      #   admins = Admin.where user_name: usn
      #   loan_managers = LoanManager.where user_name: usn
      #   accountants = Accountant.where user_name: usn
      #   clients = Client.where user_name: usn

      #   count = (admins + loan_managers + accountants + clients).count
      #   count > 0
      # end


      # def user_name_already_in_used
      #   if user_name_exists? user_name
      #     errors[:base] << "User name already in used"
      #   end
      # end
end
