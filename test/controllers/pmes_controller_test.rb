require "test_helper"

class PmesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pme = pmes(:one)
  end

  test "should get index" do
    get pmes_url
    assert_response :success
  end

  test "should get new" do
    get new_pme_url
    assert_response :success
  end

  test "should create pme" do
    assert_difference('Pme.count') do
      post pmes_url, params: { pme: { address: @pme.address, contact: @pme.contact, designation: @pme.designation, email: @pme.email, raison: @pme.raison, sector: @pme.sector, state: @pme.state, status: @pme.status } }
    end

    assert_redirected_to pme_url(Pme.last)
  end

  test "should show pme" do
    get pme_url(@pme)
    assert_response :success
  end

  test "should get edit" do
    get edit_pme_url(@pme)
    assert_response :success
  end

  test "should update pme" do
    patch pme_url(@pme), params: { pme: { address: @pme.address, contact: @pme.contact, designation: @pme.designation, email: @pme.email, raison: @pme.raison, sector: @pme.sector, state: @pme.state, status: @pme.status } }
    assert_redirected_to pme_url(@pme)
  end

  test "should destroy pme" do
    assert_difference('Pme.count', -1) do
      delete pme_url(@pme)
    end

    assert_redirected_to pmes_url
  end
end
