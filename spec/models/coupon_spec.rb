RSpec.describe Coupon, type: :model do
  it { should belong_to :collection }
  it { should belong_to :category }
  it { should belong_to :product }
  it { should have_many :carts }
  it { should have_many(:orders).through(:carts) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :amount }
  it { should validate_presence_of :discount }
  it { should validate_numericality_of(:amount).only_integer }
  it { should validate_numericality_of(:discount).only_integer }

  it 'should be valid' do
    coupon = create :coupon

    expect(coupon).to be_valid
  end
end
