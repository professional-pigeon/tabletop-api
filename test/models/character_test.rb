require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "create character attached to location" do
    location = create(:location)
    character = create(:character, char_place: location)
    assert_equal location.characters.first.id, character.id
  end
end
