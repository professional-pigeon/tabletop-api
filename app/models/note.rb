class Note < ApplicationRecord
  belongs_to :note_place, polymorphic: true
end