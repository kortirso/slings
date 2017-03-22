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
        context '.is_new_product?' do
            it 'returns false if product is not new' do
                product = create :product

                expect(product.is_new_product?).to eq false
            end

            it 'returns true if product is new' do
                product = create :product, :new_one

                expect(product.is_new_product?).to eq true
            end
        end

        context '.is_sales_hit?' do
            it 'returns false if product is not sales hit' do
                product = create :product

                expect(product.is_sales_hit?).to eq false
            end

            it 'returns true if product is not new' do
                product = create :product, :sales_hit

                expect(product.is_sales_hit?).to eq true
            end
        end

        context '.is_available_for_order?' do
            it 'returns false if amount of product is 0' do
                product = create :product

                expect(product.is_available_for_order?).to eq false
            end

            it 'returns true if amount of product is > 0' do
                product = create :product, :has_amount

                expect(product.is_available_for_order?).to eq true
            end
        end
    end
end
