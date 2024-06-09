require "application_system_test_case"

class RecieversTest < ApplicationSystemTestCase
  setup do
    @reciever = recievers(:one)
  end

  test "visiting the index" do
    visit recievers_url
    assert_selector "h1", text: "Recievers"
  end

  test "should create reciever" do
    visit recievers_url
    click_on "New reciever"

    click_on "Create Reciever"

    assert_text "Reciever was successfully created"
    click_on "Back"
  end

  test "should update Reciever" do
    visit reciever_url(@reciever)
    click_on "Edit this reciever", match: :first

    click_on "Update Reciever"

    assert_text "Reciever was successfully updated"
    click_on "Back"
  end

  test "should destroy Reciever" do
    visit reciever_url(@reciever)
    click_on "Destroy this reciever", match: :first

    assert_text "Reciever was successfully destroyed"
  end
end
