json.extract! loan_manager_profile, :id, :loan_manager_id, :image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :company, :department, :employee_category, :job_title, :manager, :enabled, :created_at, :updated_at
json.url loan_manager_profile_url(loan_manager_profile, format: :json)
