require 'test_helper'

class NotepicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notepicture = notepictures(:one)
  end

  test "should get index" do
    get notepictures_url
    assert_response :success
  end

  test "should get new" do
    get new_notepicture_url
    assert_response :success
  end

  test "should create notepicture" do
    assert_difference('Notepicture.count') do
      post notepictures_url, params: { notepicture: { disp_order: @notepicture.disp_order, note_id: @notepicture.note_id, picture: @notepicture.picture } }
    end

    assert_redirected_to notepicture_url(Notepicture.last)
  end

  test "should show notepicture" do
    get notepicture_url(@notepicture)
    assert_response :success
  end

  test "should get edit" do
    get edit_notepicture_url(@notepicture)
    assert_response :success
  end

  test "should update notepicture" do
    patch notepicture_url(@notepicture), params: { notepicture: { disp_order: @notepicture.disp_order, note_id: @notepicture.note_id, picture: @notepicture.picture } }
    assert_redirected_to notepicture_url(@notepicture)
  end

  test "should destroy notepicture" do
    assert_difference('Notepicture.count', -1) do
      delete notepicture_url(@notepicture)
    end

    assert_redirected_to notepictures_url
  end
end
