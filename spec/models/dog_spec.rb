require 'rails_helper'

RSpec.describe Dog, type: :model do

  describe 'associations' do
    it { should have_and_belong_to_many(:dog_walkings) }
    it { should belong_to(:user) }
  end

end
