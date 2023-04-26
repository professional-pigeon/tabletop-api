class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    sign_in_as(@user)
    @campaign = create(:campaign, user: @user)
  end

  test "should get all of a campaigns locations" do
    create(:location, name: 'Chicago', campaign: @campaign)
    create(:location, campaign: @campaign)
    get api_path(campaign_id: @campaign.id)
    assert_response :success
    assert_equal parsed_response['locations'].count, 2
    assert_equal parsed_response['locations'].first['name'], 'Chicago'
  end

  test "will return a single location with id" do
    location = create(:location, name: 'St Paul', campaign: @campaign)
    get api_location_path(id: location.id)
    assert_equal parsed_response['name'], 'St Paul'
  end

  test "will create a single location attached to campaign" do
    post api_locations_path(name: 'Chicago', location_type: 'city', description: 'midwestern', campaign_id: @campaign.id)
    assert_equal parsed_response['name'], 'Chicago'
  end

  test "will create a single location attached to upper_location" do
    location = create(:location, name: 'Chicago', campaign: @campaign)
    post api_locations_path(name: 'Sox Park', location_type: 'Stadium', description: 'midwestern team', campaign_id: @campaign.id, upper_location_id: location.id)
    assert_equal parsed_response['name'], 'Sox Park'
  end

  test "will update single location" do
    location = create(:location, name: 'Chicago', campaign: @campaign)
    patch api_location_path(id: location.id, name: 'St Paul')
    assert_equal parsed_response['name'], 'St Paul'
  end

  test "will destroy single location" do
    location = create(:location)
    delete api_location_path(id: location.id)
    assert_response :success
    assert_equal Location.count, 0
  end
end