class LoanInstallmentContainer < ApplicationRecord
	has_many :loan_installments, dependent: :destroy

	belongs_to :loan



  # Joins with loan_installments table
  scope :with_installments, lambda {
      joins(:loan_installment)
  }
	


	# Generates LoanInstallment Entry
	# Returns "ActiveRecord::Associations::CollectionProxy"
	def calculate
		
		duration = loan.loan_type.duration
		from_date = Time.zone.now
        end_date = from_date + 1.month


        monthly_principal = loan.principal_amount / duration
        monthly_interest = monthly_principal * loan.loan_type.rate
        monthly_emi = monthly_principal + monthly_interest


        
        duration.times do | i |
          from_date += 1.month unless i == 0
          end_date += 1.month unless i == 0


          lni = LoanInstallment.new(installment_no: i+1, client: loan.client.full_name, from: from_date, to: end_date, principal_amount: monthly_principal, interest_amount: monthly_interest, emi_installment: monthly_emi)
          
          self.loan_installments << lni
        end
        self.loan_installments
	end


end
