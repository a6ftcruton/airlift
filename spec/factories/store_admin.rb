FactoryGirl.define do
  factory :store_admin do
    first_name "John"
    last_name "Snow"
    nickname "knownothing"
    vendor_id 1
    email "winteriscoming@example.com"
    password "123"
    password_confirmation "123"
  end
end
