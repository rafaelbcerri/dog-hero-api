require 'rails_helper'

RSpec.describe Dog, type: :model do

  describe 'associations' do
    it { should have_and_belong_to_many(:dog_walkings) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:user) }
  end

end
