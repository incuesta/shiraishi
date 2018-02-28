json.extract! client_profile, :id, :image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :telephone, :company, :department, :employee_category, :job_title, :manager, :enabled, :created_at, :updated_at
json.url client_profile_url(client_profile, format: :json)
