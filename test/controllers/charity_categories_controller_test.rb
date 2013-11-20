require 'test_helper'

class CharityCategoriesControllerTest < ActionController::TestCase
  setup do
    @charity_category = charity_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charity_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charity_category" do
    assert_difference('CharityCategory.count') do
      post :create, charity_category: { name: @charity_category.name }
    end

    assert_redirected_to charity_category_path(assigns(:charity_category))
  end

  test "should show charity_category" do
    get :show, id: @charity_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @charity_category
    assert_response :success
  end

  test "should update charity_category" do
    patch :update, id: @charity_category, charity_category: { name: @charity_category.name }
    assert_redirected_to charity_category_path(assigns(:charity_category))
  end

  test "should destroy charity_category" do
    assert_difference('CharityCategory.count', -1) do
      delete :destroy, id: @charity_category
    end

    assert_redirected_to charity_categories_path
  end
end
