# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  user_id    :string
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :string
#  last_name  :string
#
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
