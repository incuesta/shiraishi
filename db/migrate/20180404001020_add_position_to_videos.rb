class AddPositionToVideos < ActiveRecord::Migration[5.1]
  def change
  	add_column :videos, :position, :int
  	add_column :videos, :tags, :string
  end
end
