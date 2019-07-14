class RemoveEventDateFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :event_date, :datetime
  end
end
