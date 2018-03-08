json.extract! loan_search, :id, :string_id, :client_last_name, :client_first_name, :client_middle_name, :loan_type_id, :application_date, :approved_date, :disbursement_date, :loan_status, :fully_paid, :created_at, :updated_at
json.url loan_search_url(loan_search, format: :json)
