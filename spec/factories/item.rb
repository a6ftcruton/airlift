FactoryGirl.define do
  sequence(:title) { |n| "#{n}" }

  factory :item do
    title { generate(:title) }
    description "taste like the first food evar"
    price 1.00
    categories { [build(:category)] }
    association :vendor
  end
end
