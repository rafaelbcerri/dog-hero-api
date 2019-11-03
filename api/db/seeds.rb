# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([
  { name: 'pet_owner' },
  { name: 'walker' }
])

User.create([
  {
    name: 'João',
    email: 'joao@gmail.com',
    password: '123123',
    password_confirmation: '123123',
    role: Role.find_by_name('walker')
  },
  {
    name: 'Maria',
    email: 'maria@gmail.com',
    password: '123123',
    password_confirmation: '123123',
    role: Role.find_by_name('pet_owner')
  },
])