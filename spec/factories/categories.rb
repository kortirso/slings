FactoryGirl.define do
    factory :category do
        sequence(:name) { |i| "Category name #{i}" }
    end
end
