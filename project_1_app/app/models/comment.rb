class Comment < ActiveRecord::Base
  before_create :save_user
  
  attr_accessible :comment_content, :song_id, :user_id

  validates :user_id, presence: :true

  belongs_to  :song
  belongs_to  :user

  def save_user
    self.user_id = current_user.id
  end

end
