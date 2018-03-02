json.extract! loan_type, :id, :name, :code, :interest_mode, :rate, :repayment_method, :created_at, :updated_at
json.url loan_type_url(loan_type, format: :json)
