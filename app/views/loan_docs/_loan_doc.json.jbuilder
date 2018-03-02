json.extract! loan_doc, :id, :name, :compulsory, :created_at, :updated_at
json.url loan_doc_url(loan_doc, format: :json)
