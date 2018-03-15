require 'test_helper'

class ActivityLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_log = activity_logs(:one)
  end

  test "should get index" do
    get activity_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_log_url
    assert_response :success
  end

  test "should create activity_log" do
    assert_difference('ActivityLog.count') do
      post activity_logs_url, params: { activity_log: { action: @activity_log.action, browser: @activity_log.browser, controller: @activity_log.controller, current_sign_in_at: @activity_log.current_sign_in_at, current_sign_in_ip: @activity_log.current_sign_in_ip, email: @activity_log.email, first_name: @activity_log.first_name, last_name: @activity_log.last_name, last_sign_in_at: @activity_log.last_sign_in_at, last_sign_in_ip: @activity_log.last_sign_in_ip, middle_name: @activity_log.middle_name, note: @activity_log.note, params: @activity_log.params, sign_in_count: @activity_log.sign_in_count, user_class: @activity_log.user_class, user_id: @activity_log.user_id, user_name: @activity_log.user_name } }
    end

    assert_redirected_to activity_log_url(ActivityLog.last)
  end

  test "should show activity_log" do
    get activity_log_url(@activity_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_log_url(@activity_log)
    assert_response :success
  end

  test "should update activity_log" do
    patch activity_log_url(@activity_log), params: { activity_log: { action: @activity_log.action, browser: @activity_log.browser, controller: @activity_log.controller, current_sign_in_at: @activity_log.current_sign_in_at, current_sign_in_ip: @activity_log.current_sign_in_ip, email: @activity_log.email, first_name: @activity_log.first_name, last_name: @activity_log.last_name, last_sign_in_at: @activity_log.last_sign_in_at, last_sign_in_ip: @activity_log.last_sign_in_ip, middle_name: @activity_log.middle_name, note: @activity_log.note, params: @activity_log.params, sign_in_count: @activity_log.sign_in_count, user_class: @activity_log.user_class, user_id: @activity_log.user_id, user_name: @activity_log.user_name } }
    assert_redirected_to activity_log_url(@activity_log)
  end

  test "should destroy activity_log" do
    assert_difference('ActivityLog.count', -1) do
      delete activity_log_url(@activity_log)
    end

    assert_redirected_to activity_logs_url
  end
end
