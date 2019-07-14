class AddDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :event_at, :datetime

  end
end
