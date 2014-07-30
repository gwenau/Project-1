class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :bio, :user_name, :image, :email, :password, :password_confirmation, :role, :user_background_style, :user_font_color_style

  has_many :songs #foreign_key: :song_name
  has_many  :comments #foreign_key: :comment_content

  mount_uploader  :image, ImageUploader

  validates :user_name, presence: true
  validates :email, presence: :true, uniqueness: true, on: :create

  def role?(role)
    self.role.to_s == role.to_s
  end
end
