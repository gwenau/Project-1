class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :image
      t.text :bio
      t.string :user_background_style
      t.string :user_font_style
      t.string :user_font_color_style

      t.timestamps
    end
  end
end
