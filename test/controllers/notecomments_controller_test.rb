require 'test_helper'

class NotecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notecomment = notecomments(:one)
  end

  test "should get index" do
    get notecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_notecomment_url
    assert_response :success
  end

  test "should create notecomment" do
    assert_difference('Notecomment.count') do
      post notecomments_url, params: { notecomment: { comment: @notecomment.comment, note_id: @notecomment.note_id, picture: @notecomment.picture, user_id: @notecomment.user_id } }
    end

    assert_redirected_to notecomment_url(Notecomment.last)
  end

  test "should show notecomment" do
    get notecomment_url(@notecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_notecomment_url(@notecomment)
    assert_response :success
  end

  test "should update notecomment" do
    patch notecomment_url(@notecomment), params: { notecomment: { comment: @notecomment.comment, note_id: @notecomment.note_id, picture: @notecomment.picture, user_id: @notecomment.user_id } }
    assert_redirected_to notecomment_url(@notecomment)
  end

  test "should destroy notecomment" do
    assert_difference('Notecomment.count', -1) do
      delete notecomment_url(@notecomment)
    end

    assert_redirected_to notecomments_url
  end
end
