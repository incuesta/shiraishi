class JustBeingClumsyLol < ActiveRecord::Migration[5.1]
  def change
  	change_column :accountant_profiles, :enabled, :boolean, default: false
  end
end
