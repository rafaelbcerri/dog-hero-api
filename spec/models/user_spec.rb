require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should belong_to(:role) }
    it { should have_many(:dog) }
    it { should have_many(:dog_walking) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

end
