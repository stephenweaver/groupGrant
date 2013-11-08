require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { access_code: @address.access_code, address_type: @address.address_type, city: @address.city, country: @address.country, full_name: @address.full_name, line_one: @address.line_one, line_two: @address.line_two, phone: @address.phone, state: @address.state, user_id: @address.user_id, zip: @address.zip }
    end

    assert_redirected_to address_path(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    patch :update, id: @address, address: { access_code: @address.access_code, address_type: @address.address_type, city: @address.city, country: @address.country, full_name: @address.full_name, line_one: @address.line_one, line_two: @address.line_two, phone: @address.phone, state: @address.state, user_id: @address.user_id, zip: @address.zip }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
