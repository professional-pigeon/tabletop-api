# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@user.com" }
    password {'mUc3m00RsqyRe' }
  end
end
