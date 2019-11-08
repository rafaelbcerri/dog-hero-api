require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should belong_to(:role) }
    it { should have_many(:dog) }
    it { should have_many(:dog_walking) }
  end

end
