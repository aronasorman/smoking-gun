require 'test_helper'

class NatureOfProblemTypesControllerTest < ActionController::TestCase
  setup do
    @nature_of_problem_type = nature_of_problem_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nature_of_problem_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nature_of_problem_type" do
    assert_difference('NatureOfProblemType.count') do
      post :create, nature_of_problem_type: { name: @nature_of_problem_type.name }
    end

    assert_redirected_to nature_of_problem_type_path(assigns(:nature_of_problem_type))
  end

  test "should show nature_of_problem_type" do
    get :show, id: @nature_of_problem_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nature_of_problem_type
    assert_response :success
  end

  test "should update nature_of_problem_type" do
    put :update, id: @nature_of_problem_type, nature_of_problem_type: { name: @nature_of_problem_type.name }
    assert_redirected_to nature_of_problem_type_path(assigns(:nature_of_problem_type))
  end

  test "should destroy nature_of_problem_type" do
    assert_difference('NatureOfProblemType.count', -1) do
      delete :destroy, id: @nature_of_problem_type
    end

    assert_redirected_to nature_of_problem_types_path
  end
end
