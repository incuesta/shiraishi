class CreateClientProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :client_profiles do |t|
      t.string :image
      t.string :sex
      t.datetime :birth_date
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :civil_status
      t.string :mobile
      t.string :telephone
      t.string :company
      t.string :department
      t.string :employee_category
      t.string :job_title
      t.string :manager
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
