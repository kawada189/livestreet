class Post < ApplicationRecord
    belongs_to :user 
    acts_as_taggable
    acts_as_taggable_on :skills, :interests
    mount_uploader :image, ImageUploader
    validates :event_at, presence: true
end
