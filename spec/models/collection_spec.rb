RSpec.describe Collection, type: :model do
  it { should have_many :products }
  it { should validate_presence_of :name }

  it 'should be valid' do
    collection = create :collection

    expect(collection).to be_valid
  end
end
