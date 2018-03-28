class ArticlePosition < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :position, :integer
  	add_column :sections, :position, :integer
  end
end
