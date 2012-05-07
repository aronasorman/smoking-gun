require 'test_helper'

class ScheduleEntriesControllerTest < ActionController::TestCase
  setup do
    @schedule_entry = schedule_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_entry" do
    assert_difference('ScheduleEntry.count') do
      post :create, schedule_entry: {  }
    end

    assert_redirected_to schedule_entry_path(assigns(:schedule_entry))
  end

  test "should show schedule_entry" do
    get :show, id: @schedule_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_entry
    assert_response :success
  end

  test "should update schedule_entry" do
    put :update, id: @schedule_entry, schedule_entry: {  }
    assert_redirected_to schedule_entry_path(assigns(:schedule_entry))
  end

  test "should destroy schedule_entry" do
    assert_difference('ScheduleEntry.count', -1) do
      delete :destroy, id: @schedule_entry
    end

    assert_redirected_to schedule_entries_path
  end
end
