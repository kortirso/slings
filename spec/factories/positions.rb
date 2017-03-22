FactoryGirl.define do
    factory :position do
        association :cart
        association :product
        count 1
        summ 0
    end
end
