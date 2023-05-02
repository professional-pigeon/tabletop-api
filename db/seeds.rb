# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# run123!

require 'faker'

def generate_notes(inst)
  x = 0
  while x <= 6
    Note.create!(content: Faker::Lorem.paragraph(sentence_count: 2), note_place: inst)
    x = x + 1
  end
end

def generate_characters(inst, num)
  x = 0
  while x <= num
    char = Character.create(name: Faker::Games::DnD.name, description: Faker::Lorem.paragraph(sentence_count: 1), character_race: 'Human', character_type: 'NPC', char_place: inst)
    generate_notes(char)
    x = x + 1
  end
end

def generate_city_areas(inst)
  x = 0
  while x <= 4
    loc = Location.create(name: Faker::Lorem.word, description: Faker::Lorem.paragraph(sentence_count: 1), location_type: Faker::Lorem.word, upper_location: inst, campaign_id: inst.campaign_id)
    generate_notes(loc)
    generate_characters(loc, 2)
    x = x + 1
  end
end

def generate_cities(inst)
  x = 0
  while x <= 9
    loc = Location.create(name: Faker::Games::DnD.city, description: Faker::Lorem.paragraph(sentence_count: 1), location_type: 'City', upper_location: inst, campaign_id: inst.campaign_id)
    generate_notes(loc)
    generate_city_areas(loc)
    generate_characters(loc, 2)
    x = x + 1
  end
end

test_user = User.find_by(user_name: 'test_user')
c = Campaign.create(name: 'Ivalice Campaign', user: test_user)
l1 = Location.create(name: 'Gallione', description: 'Western region home to Eagrose', location_type: 'Region',  campaign_id: c.id)
l2 = Location.create(name: 'Limberry', description: 'Western region home to Eagrose', location_type: 'Region',  campaign_id: c.id)
l3 = Location.create(name: 'Lionel', description: 'Western region home to Eagrose', location_type: 'Region',  campaign_id: c.id)
l4 = Location.create(name: 'Zeltennia', description: 'Western region home to Eagrose', location_type: 'Region',  campaign_id: c.id)
l5 = Location.create(name: 'Fovoham', description: 'Western region home to Eagrose', location_type: 'Region',  campaign_id: c.id)
l6 = Location.create(name: 'Lesalia', description: 'Western region home to Eagrose', location_type: 'Region',  campaign_id: c.id)

# l11 = Location.create(name: 'Eagrose Castle', description: 'Castle where Duke Larg and House Beoulove are', location_type: 'Castle', upper_location: l1, campaign_id: c.id)
# l12 = Location.create(name: 'Gariland', description: 'Small city with a local group of magicians', location_type: 'City', upper_location: l1, campaign_id: c.id)
# l13 = Location.create(name: 'Dorter', description: 'Small trade town with a robust guild', location_type: 'City', upper_location: l1, campaign_id: c.id)
# l14 = Location.create(name: 'Desert Sietch', description: 'Desert hideout where local bandits organize', location_type: 'Dungeon', upper_location: l1, campaign_id: c.id)
# l15 = Location.create(name: 'Ziekden Fortress', description: 'Abandoned fortress in snowy north', location_type: 'Fort', upper_location: l1, campaign_id: c.id)
# l16 = Location.create(name: 'Mandalia Plains', description: 'Large plains region with rolling meadows', location_type: 'Wilderness', upper_location: l1, campaign_id: c.id)
[c, l1, l2, l3, l4, l5, l6].each { |l| generate_notes(l) }
[c, l1, l2, l3, l4, l5, l6].each { |l| generate_characters(l, 5) }
[l1, l2, l3, l4, l5, l6].each { |l| generate_cities(l) }
