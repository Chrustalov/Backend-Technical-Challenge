require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'associations' do
    it { should have_many(:tasks) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
  end
end
