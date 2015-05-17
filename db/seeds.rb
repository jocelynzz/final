# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all
User.delete_all
Mapping.delete_all

User.create user_id: 1,
			name: "adminMeow", 
			password: "meowmeow",
			photo_url: "http://cutewallpaperss.com/wp-content/uploads/2015/01/cute_cats__cats_picture_cute_wallpaperss_hd_for_mobile.jpg",
			intro: "Welcome, >'.'<"

Mapping.create category_name: "catlitter"
Mapping.create category_name: "catfood"
Mapping.create category_name: "mycat"
Mapping.create category_name: "kitties"
Mapping.create category_name: "stories"
Mapping.create category_name: "spay"
Mapping.create category_name: "cuteness"
Mapping.create category_name: "questions"
Mapping.create category_name: "misc"


#     
			
# Post.create user_id: 1,
# 			post_id: 1,
# 			title: "10 Reasons Cats Meow?",
# 		#	date: Time.now
# 			body: "Reference: https://www.petfinder.com/cats/cat-behavior-and-training/why-cats-meow/
# 			1) I am getting older
# 			2) I don't want to be alone
# 			3) I am ticked off.
# 			4) I am stressed.
# 			5) I am in heat.
# 			6) Let me in.
# 			7) Pay attention to me.
# 			8) I want food.
# 			9) I am saying 'hi'
# 			10) I am hurt.
# 			"

