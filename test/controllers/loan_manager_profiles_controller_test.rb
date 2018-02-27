require 'test_helper'

class LoanManagerProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_manager_profile = loan_manager_profiles(:one)
  end

  test "should get index" do
    get loan_manager_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_manager_profile_url
    assert_response :success
  end

  test "should create loan_manager_profile" do
    assert_difference('LoanManagerProfile.count') do
      post loan_manager_profiles_url, params: { loan_manager_profile: { address: @loan_manager_profile.address, birth_date: @loan_manager_profile.birth_date, city: @loan_manager_profile.city, civil_status: @loan_manager_profile.civil_status, company: @loan_manager_profile.company, department: @loan_manager_profile.department, employee_category: @loan_manager_profile.employee_category, enabled: @loan_manager_profile.enabled, image: @loan_manager_profile.image, job_title: @loan_manager_profile.job_title, loan_manager_id: @loan_manager_profile.loan_manager_id, manager: @loan_manager_profile.manager, mobile: @loan_manager_profile.mobile, sex: @loan_manager_profile.sex, zip_code: @loan_manager_profile.zip_code } }
    end

    assert_redirected_to loan_manager_profile_url(LoanManagerProfile.last)
  end

  test "should show loan_manager_profile" do
    get loan_manager_profile_url(@loan_manager_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_manager_profile_url(@loan_manager_profile)
    assert_response :success
  end

  test "should update loan_manager_profile" do
    patch loan_manager_profile_url(@loan_manager_profile), params: { loan_manager_profile: { address: @loan_manager_profile.address, birth_date: @loan_manager_profile.birth_date, city: @loan_manager_profile.city, civil_status: @loan_manager_profile.civil_status, company: @loan_manager_profile.company, department: @loan_manager_profile.department, employee_category: @loan_manager_profile.employee_category, enabled: @loan_manager_profile.enabled, image: @loan_manager_profile.image, job_title: @loan_manager_profile.job_title, loan_manager_id: @loan_manager_profile.loan_manager_id, manager: @loan_manager_profile.manager, mobile: @loan_manager_profile.mobile, sex: @loan_manager_profile.sex, zip_code: @loan_manager_profile.zip_code } }
    assert_redirected_to loan_manager_profile_url(@loan_manager_profile)
  end

  test "should destroy loan_manager_profile" do
    assert_difference('LoanManagerProfile.count', -1) do
      delete loan_manager_profile_url(@loan_manager_profile)
    end

    assert_redirected_to loan_manager_profiles_url
  end
end
