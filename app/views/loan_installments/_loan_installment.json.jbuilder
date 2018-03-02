json.extract! loan_installment, :id, :installment_no, :client, :from, :to, :principal_amount, :interest_amount, :decimal, :emi_installment, :state, :notes, :created_at, :updated_at
json.url loan_installment_url(loan_installment, format: :json)
