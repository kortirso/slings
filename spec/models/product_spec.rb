RSpec.describe Product, type: :model do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_numericality_of(:price).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:amount).only_integer.is_greater_than_or_equal_to(0) }
    it { should belong_to :category }
    it { should have_many :positions }
    it { should have_many(:carts).through(:positions) }

    it 'should be valid' do
        product = create :product

        expect(product).to be_valid
    end

    describe 'methods' do
        context '.available_for_order?' do
            it 'returns false if amount of product is 0' do
                product = create :product

                expect(product.available_for_order?).to eq false
            end

            it 'returns true if amount of product is > 0' do
                product = create :product, :has_amount

                expect(product.available_for_order?).to eq true
            end
        end
    end
end
