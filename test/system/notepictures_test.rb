require "application_system_test_case"

class NotepicturesTest < ApplicationSystemTestCase
  setup do
    @notepicture = notepictures(:one)
  end

  test "visiting the index" do
    visit notepictures_url
    assert_selector "h1", text: "Notepictures"
  end

  test "creating a Notepicture" do
    visit notepictures_url
    click_on "New Notepicture"

    fill_in "Disp order", with: @notepicture.disp_order
    fill_in "Note", with: @notepicture.note_id
    fill_in "Picture", with: @notepicture.picture
    click_on "Create Notepicture"

    assert_text "Notepicture was successfully created"
    click_on "Back"
  end

  test "updating a Notepicture" do
    visit notepictures_url
    click_on "Edit", match: :first

    fill_in "Disp order", with: @notepicture.disp_order
    fill_in "Note", with: @notepicture.note_id
    fill_in "Picture", with: @notepicture.picture
    click_on "Update Notepicture"

    assert_text "Notepicture was successfully updated"
    click_on "Back"
  end

  test "destroying a Notepicture" do
    visit notepictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notepicture was successfully destroyed"
  end
end
