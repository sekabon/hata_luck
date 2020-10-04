# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(last_name:  "予定",
             first_name: "管理",
             last_name_kana: "ヨテイ",
             first_name_kana: "カンリ",
             birthday: "1980-12-31",
             email: "admin@test.com",
             password:  "admin09",
             password_confirmation: "admin09",
             admin: true)