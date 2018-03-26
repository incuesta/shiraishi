class Admin < ApplicationRecord
  		# Include default devise modules. Others available are:
 		# :confirmable, :lockable, :timeoutable and :omniauthable
  		devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable


    	# Admin (1:1) AdminProfile
    	has_one :admin_profile, dependent: :destroy


      # Validation
      validates :user_name, presence: true, uniqueness: true
      validates :last_name, presence: true
      validates :first_name, presence: true
      validates :middle_name, presence: true
      


    	# Used to Enable or disable an Account
    	def active_for_authentication?
  			super && self.enabled?
		  end


  		def full_name
  			"#{last_name.capitalize}, #{first_name.capitalize} #{middle_name.capitalize}"
  		end

end
