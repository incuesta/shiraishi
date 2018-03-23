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

    def inactive_message
        "Please wait for a Loan Officer to Activate your Account"
    end


    
end
