json.extract! accounting_entry, :id, :title, :entry_date, :principal_balance, :interest_income_balance, :description, :created_at, :updated_at
json.url accounting_entry_url(accounting_entry, format: :json)
