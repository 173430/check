require "application_system_test_case"

class NotecommentsTest < ApplicationSystemTestCase
  setup do
    @notecomment = notecomments(:one)
  end

  test "visiting the index" do
    visit notecomments_url
    assert_selector "h1", text: "Notecomments"
  end

  test "creating a Notecomment" do
    visit notecomments_url
    click_on "New Notecomment"

    fill_in "Comment", with: @notecomment.comment
    fill_in "Note", with: @notecomment.note_id
    fill_in "Picture", with: @notecomment.picture
    fill_in "User", with: @notecomment.user_id
    click_on "Create Notecomment"

    assert_text "Notecomment was successfully created"
    click_on "Back"
  end

  test "updating a Notecomment" do
    visit notecomments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @notecomment.comment
    fill_in "Note", with: @notecomment.note_id
    fill_in "Picture", with: @notecomment.picture
    fill_in "User", with: @notecomment.user_id
    click_on "Update Notecomment"

    assert_text "Notecomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Notecomment" do
    visit notecomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notecomment was successfully destroyed"
  end
end
