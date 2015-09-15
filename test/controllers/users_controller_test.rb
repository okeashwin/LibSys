require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get view_members" do
    get :view_members
    assert_response :success
  end

end
