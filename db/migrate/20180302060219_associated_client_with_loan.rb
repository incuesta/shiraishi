class AssociatedClientWithLoan < ActiveRecord::Migration[5.1]
  def change
  	add_reference :loans, :client, foreign_key: true
  end
end
