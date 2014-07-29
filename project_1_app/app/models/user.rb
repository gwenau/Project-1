class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :bio, :user_name, :image, :email, :password, :password_confirmation, :role, :user_background_style, :user_font_style, :user_font_color_style

  has_many :songs #foreign_key: :song_name
  has_many  :comments #foreign_key: :comment_content

  mount_uploader  :image, ImageUploader

  def role?(role_to_test)
    self.role.to_s == role_to_test.to_s
  end
end
