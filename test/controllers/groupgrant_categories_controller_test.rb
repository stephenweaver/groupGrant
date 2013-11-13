require 'test_helper'

class GroupgrantCategoriesControllerTest < ActionController::TestCase
  setup do
    @groupgrant_category = groupgrant_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupgrant_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupgrant_category" do
    assert_difference('GroupgrantCategory.count') do
      post :create, groupgrant_category: { name: @groupgrant_category.name }
    end

    assert_redirected_to groupgrant_category_path(assigns(:groupgrant_category))
  end

  test "should show groupgrant_category" do
    get :show, id: @groupgrant_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupgrant_category
    assert_response :success
  end

  test "should update groupgrant_category" do
    patch :update, id: @groupgrant_category, groupgrant_category: { name: @groupgrant_category.name }
    assert_redirected_to groupgrant_category_path(assigns(:groupgrant_category))
  end

  test "should destroy groupgrant_category" do
    assert_difference('GroupgrantCategory.count', -1) do
      delete :destroy, id: @groupgrant_category
    end

    assert_redirected_to groupgrant_categories_path
  end
end
