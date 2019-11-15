require 'test_helper'

class MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get mypage_profile_url
    assert_response :success
  end

end
