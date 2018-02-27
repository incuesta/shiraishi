class AddedLastFirstMiddleNameToLoanManager < ActiveRecord::Migration[5.1]
  def change

  		add_column :loan_managers, :user_name, :string
  		add_column :loan_managers, :timezone, :string, default: "Singapore"
  		add_column :loan_managers, :enabled, :boolean, default: false
  		add_column :loan_managers, :last_name, :string
  		add_column :loan_managers, :first_name, :string
  		add_column :loan_managers, :middle_name, :string
  end
end
