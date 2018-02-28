class ChangeAccountantProfileEnableDefaultToFalse < ActiveRecord::Migration[5.1]
  def change
  	change_column :accountants, :enabled, :boolean, default: false
  end
end
