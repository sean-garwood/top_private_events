require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  class UsersControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:one)
      @other_user = users(:two)
    end

    test "should get show when authenticated" do
      sign_in @user
      get user_url(@user)
      assert_response :success
    end

    test "should redirect show when not authenticated" do
      get user_url(@user)
      assert_redirected_to new_user_session_url
    end

    test "should show correct user" do
      sign_in @user
      get user_url(@user)
      assert_select "h1", @user.email
    end

    test "should not show other user" do
      sign_in @user
      get user_url(@other_user)
      assert_redirected_to root_url
    end
  end
end
