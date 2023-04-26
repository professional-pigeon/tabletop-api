require "test_helper"

class LocationTest < ActiveSupport::TestCase
  test "create location" do
    count = Location.count
    @location = create(:location)
    assert_equal (count + 1), Location.count
  end
end
