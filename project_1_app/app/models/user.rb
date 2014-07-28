class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :bio, :user_name, :profile_pic, :email, :password, :password_confirmation

  has_many :songs #foreign_key: :song_name
  has_many  :comments #foreign_key: :comment_content

  mount_uploader  :image, ImageUploader
end
