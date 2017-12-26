RSpec.describe Feedback, type: :model do
    it { should validate_presence_of :body }

    it 'should be valid' do
        feedback = create :feedback

        expect(feedback).to be_valid
    end
end
