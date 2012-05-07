require 'test_helper'

class InterviewTypesControllerTest < ActionController::TestCase
  setup do
    @interview_type = interview_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_type" do
    assert_difference('InterviewType.count') do
      post :create, interview_type: { name: @interview_type.name }
    end

    assert_redirected_to interview_type_path(assigns(:interview_type))
  end

  test "should show interview_type" do
    get :show, id: @interview_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview_type
    assert_response :success
  end

  test "should update interview_type" do
    put :update, id: @interview_type, interview_type: { name: @interview_type.name }
    assert_redirected_to interview_type_path(assigns(:interview_type))
  end

  test "should destroy interview_type" do
    assert_difference('InterviewType.count', -1) do
      delete :destroy, id: @interview_type
    end

    assert_redirected_to interview_types_path
  end
end
