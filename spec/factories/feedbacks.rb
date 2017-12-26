FactoryBot.define do
    factory :feedback do
        sequence(:name) { |i| "Feedback name #{i}" }
        body 'Some text'
    end
end
