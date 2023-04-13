class CharacterBlueprint < Blueprinter::Base
  identifier :id

  association :notes, blueprint: NoteBlueprint do |character, options|
    character.notes.order(updated_at: 'desc')
  end

  fields :name, :description, :character_race, :character_type


  field :character_location do |character|
    cl = character.char_place
    { id: cl.id, name: cl.name }
  end
end