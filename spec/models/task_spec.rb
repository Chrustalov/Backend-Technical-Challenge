require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'associations' do
    it { should belong_to(:member) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4) }        
    it { should validate_presence_of(:status) }
  end
end
