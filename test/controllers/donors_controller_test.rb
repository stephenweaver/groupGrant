require 'test_helper'

class DonorsController < ActionController::TestCase
	setup do
    	@donor = donors(:Bob)
  	end

  test "should get index" do
    get :new
    assert_response :success
    assert_not_nil assigns(:groupgrants)
  end

end