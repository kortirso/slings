RSpec.describe Instagram, type: :model do
  it { should have_many(:instaphotos).dependent(:destroy) }

  it 'should be valid' do
    instagram = create :instagram

    expect(instagram).to be_valid
  end
end
