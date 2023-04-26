class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    sign_in_as(@user)
    @campaign = create(:campaign, user: @user)
    @location = create(:location, campaign: @campaign)
  end

  test "should get all of the characters at a location" do
    create(:character, name: 'Pavo', char_place: @location)
    create(:character, char_place: @location)
    get api_characters_path(char_place_id: @location.id, char_place_type: 'Location')
    assert_response :success
    assert_equal parsed_response.count, 2
    assert_equal parsed_response.first['name'], 'Pavo'
  end

  test "will return a single character with id" do
    character = create(:character, name: 'Pavo-real', char_place: @location)
    get api_character_path(id: character.id)
    assert_equal parsed_response['name'], 'Pavo-real'
  end

  test "will create a single character attached to location" do
    post api_characters_path(name: 'Jonn', character_type: 'NPC', character_race: 'aarakocra', char_place_id: @location.id, char_place_type: 'Location')
    assert_equal parsed_response['name'], 'Jonn'
  end

  test "will update single character and their association type" do
    character = create(:character, name: 'Pavo', char_place: @location)
    patch api_character_path(id: character.id, name: 'Gad', char_place_id: @campaign.id, char_place_type: 'Campaign')
    assert_equal @campaign.characters.first.name, 'Gad'
    assert_equal @location.characters.count, 0
  end

  test "will destroy single character" do
    character = create(:character)
    delete api_character_path(id: character.id)
    assert_response :success
    assert_equal Character.count, 0
  end
end