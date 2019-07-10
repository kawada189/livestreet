class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.float :user_id
      t.string :title
      t.string :event_date
      t.time :start_time
      t.time :end_time
      t.text :contents

      t.timestamps
    end
  end
end
