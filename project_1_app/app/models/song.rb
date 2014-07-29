class Song < ActiveRecord::Base
  attr_accessible :song_name, :song_file, :user_id, :image

  belongs_to  :user
  has_many  :comments

  mount_uploader :image, ImageUploader
end
