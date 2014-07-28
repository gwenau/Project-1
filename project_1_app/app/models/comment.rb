class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :song_id, :user_id

  belongs_to  :song
  belongs_to  :user
end
