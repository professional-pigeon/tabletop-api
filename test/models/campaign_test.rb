require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  test "create campaign" do
    byebug
    count = Campaign.count
    @campaign = create(:campaign)
    assert_equal (count + 1), Campaign.count
  end
end