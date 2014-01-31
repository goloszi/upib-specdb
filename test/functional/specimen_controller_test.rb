require 'test_helper'

class SpecimenControllerTest < ActionController::TestCase
  setup do
    @speciman = specimen(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specimen)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create speciman" do
    assert_difference('Speciman.count') do
      post :create, speciman: { age: @speciman.age, code: @speciman.code, collection_date: @speciman.collection_date, collection_site: @speciman.collection_site, picture: @speciman.picture, sex: @speciman.sex, weight: @speciman.weight }
    end

    assert_redirected_to speciman_path(assigns(:speciman))
  end

  test "should show speciman" do
    get :show, id: @speciman
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @speciman
    assert_response :success
  end

  test "should update speciman" do
    put :update, id: @speciman, speciman: { age: @speciman.age, code: @speciman.code, collection_date: @speciman.collection_date, collection_site: @speciman.collection_site, picture: @speciman.picture, sex: @speciman.sex, weight: @speciman.weight }
    assert_redirected_to speciman_path(assigns(:speciman))
  end

  test "should destroy speciman" do
    assert_difference('Speciman.count', -1) do
      delete :destroy, id: @speciman
    end

    assert_redirected_to specimen_path
  end
end
