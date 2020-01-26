require "application_system_test_case"

class NotegoodsTest < ApplicationSystemTestCase
  setup do
    @notegood = notegoods(:one)
  end

  test "visiting the index" do
    visit notegoods_url
    assert_selector "h1", text: "Notegoods"
  end

  test "creating a Notegood" do
    visit notegoods_url
    click_on "New Notegood"

    fill_in "Note", with: @notegood.note_id
    fill_in "User", with: @notegood.user_id
    click_on "Create Notegood"

    assert_text "Notegood was successfully created"
    click_on "Back"
  end

  test "updating a Notegood" do
    visit notegoods_url
    click_on "Edit", match: :first

    fill_in "Note", with: @notegood.note_id
    fill_in "User", with: @notegood.user_id
    click_on "Update Notegood"

    assert_text "Notegood was successfully updated"
    click_on "Back"
  end

  test "destroying a Notegood" do
    visit notegoods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notegood was successfully destroyed"
  end
end
