class Post < ApplicationRecord
    belongs_to :user 
    acts_as_taggable
    acts_as_taggable_on :skills, :interests
    mount_uploader :image, ImageUploader
    # validates :event_at, presence: true

    def self.search(search) 
        if search
          Post.where(['place LIKE ?', "%#{search}%"]) 
        else
          Post.all #全て表示。User.は省略
        end
      end
      
end
