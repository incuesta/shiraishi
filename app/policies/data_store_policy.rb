class DataStorePolicy < ApplicationPolicy

	def scheduled_backup?
		@user.instance_of?(Admin)
 	end


 	def manual_backup?
 		@user.instance_of?(Admin)
 	end



end