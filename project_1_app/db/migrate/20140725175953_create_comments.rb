class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end
end
