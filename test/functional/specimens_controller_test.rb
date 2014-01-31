require 'test_helper'

class SpecimensControllerTest < ActionController::TestCase
  setup do
    @specimen = specimens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specimens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specimen" do
    assert_difference('Specimen.count') do
      post :create, specimen: { age: @specimen.age, code: @specimen.code, collection_date: @specimen.collection_date, collection_site: @specimen.collection_site, picture: @specimen.picture, sex: @specimen.sex, weight: @specimen.weight }
    end

    assert_redirected_to specimen_path(assigns(:specimen))
  end

  test "should show specimen" do
    get :show, id: @specimen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specimen
    assert_response :success
  end

  test "should update specimen" do
    put :update, id: @specimen, specimen: { age: @specimen.age, code: @specimen.code, collection_date: @specimen.collection_date, collection_site: @specimen.collection_site, picture: @specimen.picture, sex: @specimen.sex, weight: @specimen.weight }
    assert_redirected_to specimen_path(assigns(:specimen))
  end

  test "should destroy specimen" do
    assert_difference('Specimen.count', -1) do
      delete :destroy, id: @specimen
    end

    assert_redirected_to specimens_path
  end
end
