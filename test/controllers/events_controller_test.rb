# test/controllers/events_controller_test.rb
require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creator = User.first
    @event = Event.first
  end

  test "should get index" do
    get events_url
    assert_response :success
  end
end
