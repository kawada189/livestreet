class AddmapToposts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :map_lat, :decimal,  :precision => 9, :scale => 6
    add_column :posts, :map_lon, :decimal,  :precision => 9, :scale => 6
  end
end
