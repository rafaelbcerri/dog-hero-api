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
    image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=400&w=400',
    email: 'joao@gmail.com',
    password: '123123',
    password_confirmation: '123123',
    role: Role.find_by_name('walker')
  },
  {
    name: 'Maria',
    image: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&h=400&w=400',
    email: 'maria@gmail.com',
    password: '123123',
    password_confirmation: '123123',
    role: Role.find_by_name('walker')
  },
  {
    name: 'Camila',
    image: 'https://images.pexels.com/photos/1139793/pexels-photo-1139793.jpeg?auto=compress&cs=tinysrgb&h=400&w=400',
    email: 'camila@gmail.com',
    password: '123123',
    password_confirmation: '123123',
    role: Role.find_by_name('pet_owner')
  },
  {
    name: 'Isabela',
    image: 'https://images.pexels.com/photos/2008323/pexels-photo-2008323.jpeg?auto=compress&cs=tinysrgb&h=400&w=400',
    email: 'isabela@gmail.com',
    password: '123123',
    password_confirmation: '123123',
    role: Role.find_by_name('pet_owner')
  },
])

Dog.create([
  {
    name: 'Lola',
    age: 2,
    user: User.find_by_name('Camila')
  },
  {
    name: 'Duda',
    age: 13,
    user: User.find_by_name('Camila')
  },
  {
    name: 'Cookie',
    age: 4,
    user: User.find_by_name('Isabela')
  },
])

DogWalkingStatus.create([
  { name: 'created' },
  { name: 'scheduled' },
  { name: 'in_progress' },
  { name: 'done' },
])

DogWalking.create([
  {
    duration: 30,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 9 2019 16:30"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('done').id,
    begin_date: Time.parse("Nov 9 2019 16:32"),
    end_date: Time.parse("Nov 9 2019 17:01"),
    user: User.find_by_email('joao@gmail.com'),
    price: 40.0,
    dogs: [
      Dog.find_by_name('Lola'),
      Dog.find_by_name('Duda')
    ]
  },
  {
    duration: 30,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 7 2019 16:30"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('done').id,
    begin_date: Time.parse("Nov 7 2019 16:32"),
    end_date: Time.parse("Nov 7 2019 17:01"),
    user: User.find_by_email('joao@gmail.com'),
    price: 25.0,
    dogs: [
      Dog.find_by_name('Lola')
    ]
  },
  {
    duration: 60,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 8 2019 12:30"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('done').id,
    begin_date: Time.parse("Nov 8 2019 12:32"),
    end_date: Time.parse("Nov 8 2019 13:33"),
    user: User.find_by_email('maria@gmail.com'),
    price: 55.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 30,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 12 2019 12:30"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('scheduled').id,
    begin_date: nil,
    end_date: nil,
    user: User.find_by_email('maria@gmail.com'),
    price: 25.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 60,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 13 2019 11:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('scheduled').id,
    begin_date: nil,
    end_date: nil,
    user: User.find_by_email('maria@gmail.com'),
    price: 55.0,
    dogs: [
      Dog.find_by_name('Lola'),
      Dog.find_by_name('Duda')
    ]
  },
  {
    duration: 60,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 13 2019 18:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('scheduled').id,
    begin_date: nil,
    end_date: nil,
    user: User.find_by_email('joao@gmail.com'),
    price: 35.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 30,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 10 2019 10:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 25.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 30,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 2 2019 17:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 40.0,
    dogs: [
      Dog.find_by_name('Lola'),
      Dog.find_by_name('Duda')
    ]
  },
  {
    duration: 60,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 14 2019 17:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 55.0,
    dogs: [
      Dog.find_by_name('Lola'),
      Dog.find_by_name('Duda')
    ]
  },
  {
    duration: 60,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 16 2019 17:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 55.0,
    dogs: [
      Dog.find_by_name('Lola'),
      Dog.find_by_name('Duda')
    ]
  },
  {
    duration: 30,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 17 2019 10:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 40.0,
    dogs: [
      Dog.find_by_name('Lola'),
      Dog.find_by_name('Duda')
    ]
  },
  {
    duration: 30,
    latitude: "-23.534296",
    longitude: "-46.724113",
    scheduled_date: Time.parse("Nov 19 2019 11:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 40.0,
    dogs: [
      Dog.find_by_name('Lola'),
      Dog.find_by_name('Duda')
    ]
  },
  {
    duration: 30,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 11 2019 11:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 25.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 30,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 12 2019 11:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 25.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 30,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 14 2019 10:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 25.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 60,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 16 2019 17:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 35.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 60,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 17 2019 17:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 35.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  },
  {
    duration: 60,
    latitude: "-23.558529",
    longitude: "-46.692096",
    scheduled_date: Time.parse("Nov 18 2019 17:00"),
    dog_walking_status_id: DogWalkingStatus.find_by_name('created').id,
    begin_date: nil,
    end_date: nil,
    user: nil,
    price: 35.0,
    dogs: [
      Dog.find_by_name('Cookie')
    ]
  }
])