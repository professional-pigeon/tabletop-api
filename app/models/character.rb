class Character < ApplicationRecord
  belongs_to :char_place, polymorphic: true
  has_many :notes, as: :note_place, dependent: :destroy
  enum character_type: { npc: 'NPC', pc: 'Player' }
  enum character_race: { 
    aarakocra: 'Aarakocra', 
    human: 'Human', 
    orc: 'Orc',
    tabaxi: 'Tabaxi',
    elf: 'Elf',
    genasi: 'Genasi',
    dwarf: 'Dwarf',
    halfling: 'Halfling',
    other: 'Other'
  }
end
