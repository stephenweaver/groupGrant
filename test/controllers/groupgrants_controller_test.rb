require 'test_helper'

class GroupgrantsControllerTest < ActionController::TestCase
  setup do
    @groupgrant = groupgrants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupgrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupgrant" do
    assert_difference('Groupgrant.count') do
      post :create, groupgrant: { completed_date: @groupgrant.completed_date, description: @groupgrant.description, goal_amount: @groupgrant.goal_amount, goal_date: @groupgrant.goal_date, is_complete: @groupgrant.is_complete, is_enabled: @groupgrant.is_enabled, name: @groupgrant.name, owner_id: @groupgrant.owner_id, partner_id: @groupgrant.partner_id, video_url: @groupgrant.video_url }
    end

    assert_redirected_to groupgrant_path(assigns(:groupgrant))
  end

  test "should show groupgrant" do
    get :show, id: @groupgrant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupgrant
    assert_response :success
  end

  test "should update groupgrant" do
    patch :update, id: @groupgrant, groupgrant: { completed_date: @groupgrant.completed_date, description: @groupgrant.description, goal_amount: @groupgrant.goal_amount, goal_date: @groupgrant.goal_date, is_complete: @groupgrant.is_complete, is_enabled: @groupgrant.is_enabled, name: @groupgrant.name, owner_id: @groupgrant.owner_id, partner_id: @groupgrant.partner_id, video_url: @groupgrant.video_url }
    assert_redirected_to groupgrant_path(assigns(:groupgrant))
  end

  test "should destroy groupgrant" do
    assert_difference('Groupgrant.count', -1) do
      delete :destroy, id: @groupgrant
    end

    assert_redirected_to groupgrants_path
  end
end
