# test/controllers/events_controller_test.rb
require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creator = User.create!(name: "Test Creator")
    @event = Event.create!(name: "Test Event", creator: @creator)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end
end
