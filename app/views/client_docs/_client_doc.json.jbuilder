json.extract! client_doc, :id, :name, :submitted, :created_at, :updated_at
json.url client_doc_url(client_doc, format: :json)
