class Comment < ActiveRecord::Base

  attr_accessible :comment_content, :song_id, :user_id

  validates :user_id, presence: :true

  belongs_to  :song
  belongs_to  :user


end
