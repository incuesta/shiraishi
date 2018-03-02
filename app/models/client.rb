class Client < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable



	has_one :client_profile, dependent: :destroy

    has_one :golden_key, dependent: :destroy # the Model to Enable or disable an Account

    

    has_one :loan, dependent: :destroy # A client can only have 1 loan at a time.



	# Validation
    validates :user_name, presence: true, uniqueness: true
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :middle_name, presence: true



    def full_name
    	"#{last_name.capitalize} #{first_name.capitalize} #{middle_name.capitalize}"
    end



    def active_for_authentication?
        super && self.golden_key.enabled?
    end
end
