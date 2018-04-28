FactoryBot.define do
  factory :collection do
    sequence(:name) { |i| "Collection name #{i}" }
  end
end
