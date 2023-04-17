class Campaign < ApplicationRecord
  belongs_to :user
  has_many :locations, dependent: :destroy
  has_many :characters, as: :char_place, dependent: :destroy
  has_many :notes, as: :note_place, dependent: :destroy

  def get_player_characters
    @characters = []
    locations = self.locations
    cc = self.characters.where(character_type: 'player')
    lc = locations.map { |l| l.characters.where(character_type: 'pc') }.flatten
    @characters.push(cc, lc).flatten
  end

  def get_highest_level_locations
    self.locations.where(upper_location_id: nil)
  end
end