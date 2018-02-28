class LoanManager < ApplicationRecord
		# Include default devise modules. Others available are:
		# :confirmable, :lockable, :timeoutable and :omniauthable
		devise :database_authenticatable, :registerable,
		         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable


        has_one :loan_manager_profile
  

  		def full_name
  			"#{last_name.capitalize} #{first_name.capitalize} #{middle_name.capitalize}"
  		end
end
