# == Schema Information
#
# Table name: characters
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  character_type  :string           not null
#  character_race  :string           default("unknown")
#  description     :string           default("")
#  char_place_type :string
#  char_place_id   :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :character do
    name { 'tom' }
    character_type { 'npc' }
    character_race { 'aarakocra' }
    description { 'character description' }
    char_place { create(:location) }
  end
end
