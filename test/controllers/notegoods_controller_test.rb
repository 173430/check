require 'test_helper'

class NotegoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notegood = notegoods(:one)
  end

  test "should get index" do
    get notegoods_url
    assert_response :success
  end

  test "should get new" do
    get new_notegood_url
    assert_response :success
  end

  test "should create notegood" do
    assert_difference('Notegood.count') do
      post notegoods_url, params: { notegood: { note_id: @notegood.note_id, user_id: @notegood.user_id } }
    end

    assert_redirected_to notegood_url(Notegood.last)
  end

  test "should show notegood" do
    get notegood_url(@notegood)
    assert_response :success
  end

  test "should get edit" do
    get edit_notegood_url(@notegood)
    assert_response :success
  end

  test "should update notegood" do
    patch notegood_url(@notegood), params: { notegood: { note_id: @notegood.note_id, user_id: @notegood.user_id } }
    assert_redirected_to notegood_url(@notegood)
  end

  test "should destroy notegood" do
    assert_difference('Notegood.count', -1) do
      delete notegood_url(@notegood)
    end

    assert_redirected_to notegoods_url
  end
end
