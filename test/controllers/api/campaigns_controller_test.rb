class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    sign_in_as(@user)
  end

  test "should get all of a users campaigns" do
    create(:campaign, name: 'Iago', user: @user)
    create(:campaign, user: @user)
    get "/api/user/campaigns"
    assert_response :success
    assert_equal parsed_response.count, 2
    assert_equal parsed_response.first['name'], 'Iago'
  end

  test "will return a single campaign with id" do
    campaign = create(:campaign, name: 'Iago 2', user: @user)
    get api_campaign_path(id: campaign.id)
    assert_equal parsed_response['name'], 'Iago 2'
  end

  test "will create a single campaign attached to user" do
    post api_campaigns_path(name: 'Iago 2', user_id: @user.id)
    assert_equal parsed_response['name'], 'Iago 2'
  end

  test "will update single campaign" do
    campaign = create(:campaign, name: 'Iago 2', user: @user)
    patch api_campaign_path(id: campaign.id, name: 'Iago 3')
    assert_equal parsed_response['name'], 'Iago 3'
  end

  test "will destroy single campaign" do
    campaign = create(:campaign, user: @user)
    delete api_campaign_path(id: campaign.id)
    assert_response :success
    assert_equal Campaign.count, 0
  end
end