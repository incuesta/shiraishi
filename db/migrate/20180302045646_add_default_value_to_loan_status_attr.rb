class AddDefaultValueToLoanStatusAttr < ActiveRecord::Migration[5.1]
  def change
  	change_column :loans, :status, :string, default: "draft"
  end
end
