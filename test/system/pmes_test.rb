require "application_system_test_case"

class PmesTest < ApplicationSystemTestCase
  setup do
    @pme = pmes(:one)
  end

  test "visiting the index" do
    visit pmes_url
    assert_selector "h1", text: "Pmes"
  end

  test "creating a Pme" do
    visit pmes_url
    click_on "New Pme"

    fill_in "Address", with: @pme.address
    fill_in "Contact", with: @pme.contact
    fill_in "Designation", with: @pme.designation
    fill_in "Email", with: @pme.email
    fill_in "Raison", with: @pme.raison
    fill_in "Sector", with: @pme.sector
    fill_in "State", with: @pme.state
    fill_in "Status", with: @pme.status
    click_on "Create Pme"

    assert_text "Pme was successfully created"
    click_on "Back"
  end

  test "updating a Pme" do
    visit pmes_url
    click_on "Edit", match: :first

    fill_in "Address", with: @pme.address
    fill_in "Contact", with: @pme.contact
    fill_in "Designation", with: @pme.designation
    fill_in "Email", with: @pme.email
    fill_in "Raison", with: @pme.raison
    fill_in "Sector", with: @pme.sector
    fill_in "State", with: @pme.state
    fill_in "Status", with: @pme.status
    click_on "Update Pme"

    assert_text "Pme was successfully updated"
    click_on "Back"
  end

  test "destroying a Pme" do
    visit pmes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pme was successfully destroyed"
  end
end
