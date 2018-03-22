RSpec.describe Cart, type: :model do
  it { should belong_to :coupon }
  it { should have_many :positions }
  it { should have_many(:products).through(:positions) }
  it { should have_one :order }
  it { should validate_presence_of :summ }
  it { should validate_numericality_of(:summ).only_integer.is_greater_than_or_equal_to(0) }

  it 'should be valid' do
    cart = create :cart

    expect(cart).to be_valid
  end
end
