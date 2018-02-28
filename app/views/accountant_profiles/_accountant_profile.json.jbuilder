json.extract! accountant_profile, :id, :accountant_id, :image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :company, :department, :employee_category, :job_title, :manager, :enabled, :created_at, :updated_at
json.url accountant_profile_url(accountant_profile, format: :json)
