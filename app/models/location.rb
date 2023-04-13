class Location < ApplicationRecord
  belongs_to :campaign
  has_many :inner_locations, class_name: 'Location', foreign_key: 'upper_location_id', dependent: :destroy
  belongs_to :upper_location, class_name: 'Location', optional: true
  has_many :characters, as: :char_place, dependent: :destroy
  has_many :notes, as: :note_place, dependent: :destroy
end
