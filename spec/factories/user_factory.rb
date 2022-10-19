FactoryBot.define do
  factory :user do
    # first_name { 'Connor' }
    # last_name { 'Hughes' }
    # email { 'connor@gmail.com' }
    name { 'Connor' }
    password { '123123' }
    phone_number { '+27 123 123 12' }
    role { :user }

    factory :admin do
      role { :admin }
    end
  end
end