FactoryBot.define do
    factory :product do
        sequence(:name) { |i| "Product name #{i}" }
        price 100
        amount 0
        new_one false
        sales_hit false
        association :category
        association :event

        trait :new_one do
            new_one true
        end

        trait :sales_hit do
            sales_hit true
        end

        trait :has_amount do
            amount 1
        end
    end
end
