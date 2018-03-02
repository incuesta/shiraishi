json.extract! loan, :id, :string_id, :application_date, :approved_date, :disbursement_date, :status, :principal_amount, :from, :to, :principal_amount, :net_loan, :net_interest, :notes, :created_at, :updated_at
json.url loan_url(loan, format: :json)
