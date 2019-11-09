require 'rails_helper'

RSpec.describe DogWalking, type: :model do

  let(:dog_walking) { build(:dog_walking) }

  describe 'associations' do
    it { should have_and_belong_to_many(:dogs) }
    it { should belong_to(:dog_walking_status) }
    it { should belong_to(:user).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:scheduled_date) }
    it { should validate_presence_of(:dog_walking_status_id) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:dogs) }
  end

  describe '#calculate_price' do

    let(:dog) { build(:dog) }

    context 'when there are no dogs and duration' do
      it 'should return 0' do
        dog_walking.duration = nil

        expect(dog_walking.calculate_price).to be 0
      end
    end

    context 'when there are one dog and duration is 30' do
      it 'should return 25' do
        dog_walking.dogs = [ dog ]

        expect(dog_walking.calculate_price).to be 25
      end
    end

    context 'when there are two dogs and duration is 30' do
      it 'should return 40' do
       dog_walking.dogs = [ dog, dog ]

        expect(dog_walking.calculate_price).to be 40
      end
    end

    context 'when there are one dogs and duration is 60' do
      it 'should return 35' do
        dog_walking.duration = 60
        dog_walking.dogs = [ dog ]

        expect(dog_walking.calculate_price).to be 35
      end
    end

    context 'when there are two dogs and duration is 60' do
      it 'should return 55' do
        dog_walking.duration = 60
        dog_walking.dogs = [ dog, dog ]

        expect(dog_walking.calculate_price).to be 55
      end
    end
  end

  describe '#walk_duration' do
    context 'when there are no begin_date and end_date' do
      it 'should return 00:00:00' do
        dog_walking.end_date = nil
        dog_walking.begin_date = nil

        expect(dog_walking.walk_duration).to eq '00:00:00'
      end
    end

    context 'when there are begin_date and end_date' do
      it 'should return the walk duration' do
        expect(dog_walking.walk_duration).to eq '00:30:00'
      end
    end
  end

end
