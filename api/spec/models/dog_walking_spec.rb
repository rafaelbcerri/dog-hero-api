require 'rails_helper'

RSpec.describe DogWalking, type: :model do

  describe 'associations' do
    it { should have_and_belong_to_many(:dogs) }
    it { should belong_to(:dog_walking_status) }
    it { should belong_to(:user).optional }
  end

  describe '#calcule_price' do
    let(:user) {
      User.create({
        name: 'João',
        image: '',
        email: 'joao@gmail.com',
        password: '123123',
        password_confirmation: '123123',
        role: Role.create({ name: 'pet_owner' })
      })
    }

    let(:dog_one) {
      Dog.create({
        name: 'Dog',
        age: 1,
        user: user
      })
    }

    let(:dog_two) {
      Dog.create({
        name: 'Dog 2',
        age: 1,
        user: user
      })
    }

    context 'when there are no dogs and duration' do
      it 'should return 0' do
        dog_walking = DogWalking.create({
          duration: nil,
          dogs: []
        })

        expect(dog_walking.calcule_price).to be 0
      end
    end

    context 'when there are one dog and duration is 30' do
      it 'should return 25' do
        dog_walking = DogWalking.create({
          duration: 30,
          dogs: [ dog_one ]
        })

        expect(dog_walking.calcule_price).to be 25
      end
    end

    context 'when there are two dogs and duration is 30' do
      it 'should return 40' do
        dog_walking = DogWalking.create({
          duration: 30,
          dogs: [ dog_one, dog_two ]
        })

        expect(dog_walking.calcule_price).to be 40
      end
    end

    context 'when there are one dogs and duration is 60' do
      it 'should return 35' do
        dog_walking = DogWalking.create({
          duration: 60,
          dogs: [ dog_one ]
        })

        expect(dog_walking.calcule_price).to be 35
      end
    end

    context 'when there are two dogs and duration is 60' do
      it 'should return 55' do
        dog_walking = DogWalking.create({
          duration: 60,
          dogs: [ dog_one, dog_two ]
        })

        expect(dog_walking.calcule_price).to be 55
      end
    end
  end

  describe '#walk_duration' do
    context 'when there are no begin_date and end_date' do
      it 'should return 00:00:00' do
        dog_walking = DogWalking.create({
          end_date: nil,
          begin_date: nil
        })

        expect(dog_walking.walk_duration).to eq '00:00:00'
      end
    end

    context 'when there are begin_date and end_date' do
      it 'should return the walk duration' do
        time = Time.now
        dog_walking = DogWalking.create({
          end_date: time,
          begin_date: time - 10.minutes
        })

        expect(dog_walking.walk_duration).to eq '00:10:00'
      end
    end
  end

end
