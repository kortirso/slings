RSpec.describe Category, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :products }

  it 'should be valid' do
    category = create :category

    expect(category).to be_valid
  end
end
