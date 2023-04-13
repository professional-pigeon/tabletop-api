class NoteBlueprint < Blueprinter::Base
  identifier :id

  field :content
  field :updated_at, datetime_format: "%m/%d/%Y"
end