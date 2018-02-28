class AddAssociationBetClientAndClientProfile < ActiveRecord::Migration[5.1]
  def change

  		add_reference :client_profiles, :client, foreign_key: true
  end
end
