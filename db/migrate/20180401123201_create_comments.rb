class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.bigint :commenter
      t.string :commenter_class
      t.text :body

      t.timestamps
      t.index :commenter
    end
  end
end
