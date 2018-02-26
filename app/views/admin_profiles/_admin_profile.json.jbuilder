json.extract! admin_profile, :id, :image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :company, :department, :employee_category, :job_title, :manager, :created_at, :updated_at
json.url admin_profile_url(admin_profile, format: :json)
