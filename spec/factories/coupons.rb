FactoryBot.define do
  factory :coupon do
    sequence(:name) { |i| "ABCD#{i}" }
    amount 5
    discount 5
    started_at DateTime.now
    finished_at DateTime.now + 2.days
    association :product
  end
end
