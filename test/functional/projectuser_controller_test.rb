require 'test_helper'

class ProjectuserControllerTest < ActionController::TestCase
  test "should get add_user_to_project" do
    get :add_user_to_project
    assert_response :success
  end

end
