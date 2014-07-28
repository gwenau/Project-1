# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Song.delete_all
Comment.delete_all

u1 = User.create(user_name: "Michael Hutchinson", email: "micheal_hutchinson@gmail.com", bio: "New to Under Ground Music, just checking out the scene.")

u2 = User.create(user_name: "Sarah Marshall", email: "sara_marshall@hotmail.com", bio: "I heard this place was good. So I'll give it a try")

u3 = User.create(user_name: "Amy Adams", email: "amy_adams@yahoo.com", bio: "I'm a singer and I want the world to hear me.")

u4 = User.create(user_name: "Listener 1", email: "roberto_jackson@hotmail.com")

u5 = User.create(user_name: "Listener 2", email: "jessie_jay@hotmail.com")

u6 = User.create(user_name: "Listener 3", email: "ronald_reggae@hotmail.com")

u7 = User.create(user_name: "Moderator today", email: "moderator@undergroundmusic.com")

s1 = Song.create(song_name: "Video Video", song_file: "s1 song file", user_id: 1)

s2 = Song.create(song_name: "Phone Phone", song_file: "s2 song file", user_id: 2)

s3 = Song.create(song_name: "Chip Munk", song_file: "s3 song file", user_id: 3)

s4 = Song.create(song_name: "Lonely Heart", song_file: "s4 song file", user_id: 3)

s5 = Song.create(song_name: "Happy Heart", song_file: "s5 song file", user_id: 3)

c1 = Comment.create(comment_content: "This is crap", song_id: 1, user_id: 4)

c2 = Comment.create(comment_content: "This is very good", song_id: 2, user_id: 4)

c3 = Comment.create(comment_content: "Could be better", song_id: 1, user_id: 5)

c4 = Comment.create(comment_content: "Could be worst LOL", song_id: 2, user_id: 6)

s6 = Song.create(song_name: "Additional Anthem", song_file: "s6 song file", user_id: 1)

c5 = Comment.create(comment_content: "Seeing what comes up to make sure it's OK", song_id: 6, user_id: 7)
