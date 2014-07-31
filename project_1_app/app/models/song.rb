class Song < ActiveRecord::Base
  
  # before_create :save_user  

  attr_accessible :song_name, :song_file, :user_id, :image

  belongs_to  :user
  has_many  :comments

  mount_uploader :image, ImageUploader
  mount_uploader :song_file, SongUploader

  # This appears to have worked!!!
  # def save_user
  #   self.user_id = current_user.id
  # end
  
end
