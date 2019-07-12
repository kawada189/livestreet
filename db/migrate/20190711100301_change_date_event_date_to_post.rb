class ChangeDateEventDateToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :event_date, :datetime
  end
end
