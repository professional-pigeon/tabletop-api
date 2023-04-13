class CampaignBlueprint < Blueprinter::Base
  identifier :id

  fields :name

  view :full do
    association :notes, blueprint: NoteBlueprint do |campaign|
      campaign.notes.order(updated_at: 'desc')
    end
  
    association :locations, blueprint: LocationBlueprint, view: :extended do |campaign|
      campaign.get_highest_level_locations
    end

    association :characters, blueprint: CharacterBlueprint
  end

  view :all_locations do
    association :locations, blueprint: LocationBlueprint
  end
end