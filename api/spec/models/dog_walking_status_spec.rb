require 'rails_helper'

RSpec.describe DogWalkingStatus, type: :model do

  describe 'associations' do
    it { should have_many(:dog_walkings) }
  end

end
