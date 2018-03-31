class DataStoresController < ApplicationController
  	
  	before_action :set_app_name, only: [:capture_db, :restore_db]
  	before_action :set_up_pg, only: [:backup_from_dump, :restore_from_dump]





  	def scheduled_backup
  		authorize :data_store	
 	end


 	def manual_backup
 		authorize :data_store
 		
 		@capture_db_state_link = 'localhost:3000/data_stores/capture_db'
 		@restore_db_state_link = 'localhost:3000/data_stores/restore_db'


 		# Use pg_dump and pg_restore instead
 		if Rails.env.development?
 			@capture_db_state_link = data_stores_backup_from_dump_path
 			@restore_db_state_link = data_stores_restore_from_dump_path 			
 		end
 	end







 	# Uses pg_dump 
 	# Note: this is only relevant for Dev env
 	def backup_from_dump

 		cmd = "pg_dump --format=c --verbose --username=#{@user} --host=#{@host_development} --no-owner --no-acl --no-password --file=c:/backup.dump #{@db_name}"
 		system cmd

 		redirect_to data_stores_manual_backup_path, notice: 'Database was successfully dumped to :C'
 	end




 	# Uses pg_restore
 	# Note: this is only relevant for Dev env
 	def restore_from_dump

 		cmd = "pg_restore --format=c --verbose --username=#{@user} --host=#{@host_development} --clean --no-owner --no-acl --dbname=#{@db_name} c:/backup.dump"
 		system cmd

 		redirect_to data_stores_manual_backup_path, notice: 'Database was successfully restored'
 	end





 	# This is meant to be invoked on a local connection
 	def capture_db
 		cmd = "heroku pg:backups:capture --app #{@app_name}"
 		system cmd

 		redirect_to data_stores_manual_backup_path, notice: 'Database was successfully backuped to Cloud'
 	end


 	# This is meant to be invoked on a local connection
 	def restore_db
 		cmd = "heroku pg:backups:restore --app #{@app_name} --confirm #{@app_name}"
 		system cmd

 		redirect_to data_stores_manual_backup_path, notice: 'Database was successfully restored from Cloud'
 	end



 	private

 		def set_app_name
 			@app_name = "acgecco"
 		end


 		def set_up_pg
 			@user = 'postgres'
	 		@host_development = 'localhost'
	 		@db_name = 'shiraishi'
 		end
end
