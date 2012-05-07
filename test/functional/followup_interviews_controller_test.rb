require 'test_helper'

class FollowupInterviewsControllerTest < ActionController::TestCase
  setup do
    @followup_interview = followup_interviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:followup_interviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create followup_interview" do
    assert_difference('FollowupInterview.count') do
      post :create, followup_interview: { comments: @followup_interview.comments, planned_intervention: @followup_interview.planned_intervention }
    end

    assert_redirected_to followup_interview_path(assigns(:followup_interview))
  end

  test "should show followup_interview" do
    get :show, id: @followup_interview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @followup_interview
    assert_response :success
  end

  test "should update followup_interview" do
    put :update, id: @followup_interview, followup_interview: { comments: @followup_interview.comments, planned_intervention: @followup_interview.planned_intervention }
    assert_redirected_to followup_interview_path(assigns(:followup_interview))
  end

  test "should destroy followup_interview" do
    assert_difference('FollowupInterview.count', -1) do
      delete :destroy, id: @followup_interview
    end

    assert_redirected_to followup_interviews_path
  end
end
