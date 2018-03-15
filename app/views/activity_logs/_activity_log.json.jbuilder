json.extract! activity_log, :id, :user_id, :user_class, :user_name, :email, :last_name, :first_name, :middle_name, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :browser, :controller, :action, :params, :note, :created_at, :updated_at
json.url activity_log_url(activity_log, format: :json)
