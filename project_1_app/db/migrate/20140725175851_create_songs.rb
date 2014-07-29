class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :image
      t.string :song_file
      t.integer :user_id

      t.timestamps
    end
  end
end
