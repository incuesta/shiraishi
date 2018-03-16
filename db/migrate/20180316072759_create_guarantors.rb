class CreateGuarantors < ActiveRecord::Migration[5.1]
  def change
    create_table :guarantors do |t|
      t.references :client, foreign_key: true
      t.string :image
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :sex
      t.datetime :birth_date
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :civil_status
      t.string :mobile
      t.string :company
      t.string :job_title

      t.timestamps
    end
  end
end
