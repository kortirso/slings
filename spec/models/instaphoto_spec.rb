RSpec.describe Instaphoto, type: :model do
    it { should belong_to :instagram }
    it { should validate_presence_of :instagram_id }

    it 'should be valid' do
        instaphoto = create :instaphoto

        expect(instaphoto).to be_valid
    end
end
