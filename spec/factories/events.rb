FactoryGirl.define do
    factory :event do
        sequence(:name) { |i| "Event name #{i}" }
        discount 0
        start_date DateTime.current
        end_date DateTime.current + 1
    end
end
