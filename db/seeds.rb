# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if User.all.empty?
  User.create!(
    first_name: 'Connor',
    last_name: 'Hughes',
    email: 'chughes@neslotech.co.za',
    password: '123123',
    password_confirmation: '123123',
    role: 'user',
  )
  User.create!(
    first_name: 'Ryan',
    last_name: 'Kennedy',
    email: 'jeffthejeffington@gmail.com',
    password: '123123',
    password_confirmation: '123123',
    role: 'admin',
    )
end
