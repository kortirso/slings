RSpec.describe Event, type: :model do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_numericality_of(:discount).only_integer.is_greater_than_or_equal_to(0) }

    it 'should be valid' do
        event = create :event

        expect(event).to be_valid
    end
end
