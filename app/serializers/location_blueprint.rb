class LocationBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :location_type, :description

  association :notes, blueprint: NoteBlueprint do |location|
    location.notes.order(updated_at: 'desc')
  end
  
  association :inner_locations, blueprint: LocationBlueprint do |location|
    location.inner_locations
  end
  
  field :upper_location do |location|
    ul = location.upper_location
    if (!ul)
      nil
    else
      { id: ul.id, name: ul.name }
    end
  end

  view :with_characters do
    association :characters, blueprint: CharacterBlueprint
  end

  view :extended do
    association :characters, blueprint: CharacterBlueprint
  end
end