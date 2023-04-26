# == Schema Information
#
# Table name: locations
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  location_type :string           not null
#  description   :string           default("")
#  campaign_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :location do
    campaign { create(:campaign) }
    name { 'test_location' }
    location_type { 'city' }
    description { 'Location description' }
  end
end
