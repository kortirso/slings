RSpec.describe Config, type: :model do
    it 'should be valid' do
        config = create :config

        expect(config).to be_valid
    end
end
