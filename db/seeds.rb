# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(username: 'realperson1', email: 'placeholder@email.com', password: 'password')
nick_a = User.create!(username: 'NinetiesNick', email: 'NA@email.com', password: 'adminpassword', role: 'admin')
nick_b = User.create!(username: 'NearlyNinetiesNick', email: 'NB@email.com', password: 'adminpassword', role: 'admin')
sean = User.create!(username: 'SevereSean', email: 'SK@email.com', password: 'adminpassword', role: 'admin')
scott = User.create!(username: 'ScottLordOfReact', email: 'SE@email.com', password: 'adminpassword', role: 'admin')
yonatan = User.create!(username: 'CSSMaster', email: 'YMK@email.com', password: 'adminpassword', role: 'admin')

Item.create!(
  title: 'Power Rangers', description: 'Go Go Power Rangers! WEOSWWWEAHHWOOAWOAHWOAH', user: user, image: File.open(Rails.root + "app/assets/images/seed/maxresdefault.jpg")
)
Item.create!(
  title: 'Magic School Bus', description: 'Ms. Frizzle taught us science', user: user, image: File.open(Rails.root + "app/assets/images/seed/MSB_CollectionHeader.jpg")
)
Item.create!(
  title: 'Fall of the Soviet Union', description: 'A victory for capitalism and the free world', user: user, image: File.open(Rails.root + "app/assets/images/seed/History_Jeffrey_Lewis_The_Fall_of_the_Soviet_Union_rev_rev_SF_HD_still_624x352.jpg")
)
