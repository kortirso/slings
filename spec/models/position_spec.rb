RSpec.describe Position, type: :model do
    it { should belong_to :cart }
    it { should belong_to :product }
    it { should validate_presence_of :cart_id }
    it { should validate_presence_of :product_id }
    it { should validate_presence_of :count }
    it { should validate_numericality_of(:count).only_integer.is_greater_than_or_equal_to(0) }

    it 'should be valid' do
        position = create :position
        
        expect(position).to be_valid
    end
end
