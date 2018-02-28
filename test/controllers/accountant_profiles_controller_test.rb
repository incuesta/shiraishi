require 'test_helper'

class AccountantProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accountant_profile = accountant_profiles(:one)
  end

  test "should get index" do
    get accountant_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_accountant_profile_url
    assert_response :success
  end

  test "should create accountant_profile" do
    assert_difference('AccountantProfile.count') do
      post accountant_profiles_url, params: { accountant_profile: { accountant_id: @accountant_profile.accountant_id, address: @accountant_profile.address, birth_date: @accountant_profile.birth_date, city: @accountant_profile.city, civil_status: @accountant_profile.civil_status, company: @accountant_profile.company, department: @accountant_profile.department, employee_category: @accountant_profile.employee_category, enabled: @accountant_profile.enabled, image: @accountant_profile.image, job_title: @accountant_profile.job_title, manager: @accountant_profile.manager, mobile: @accountant_profile.mobile, sex: @accountant_profile.sex, zip_code: @accountant_profile.zip_code } }
    end

    assert_redirected_to accountant_profile_url(AccountantProfile.last)
  end

  test "should show accountant_profile" do
    get accountant_profile_url(@accountant_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_accountant_profile_url(@accountant_profile)
    assert_response :success
  end

  test "should update accountant_profile" do
    patch accountant_profile_url(@accountant_profile), params: { accountant_profile: { accountant_id: @accountant_profile.accountant_id, address: @accountant_profile.address, birth_date: @accountant_profile.birth_date, city: @accountant_profile.city, civil_status: @accountant_profile.civil_status, company: @accountant_profile.company, department: @accountant_profile.department, employee_category: @accountant_profile.employee_category, enabled: @accountant_profile.enabled, image: @accountant_profile.image, job_title: @accountant_profile.job_title, manager: @accountant_profile.manager, mobile: @accountant_profile.mobile, sex: @accountant_profile.sex, zip_code: @accountant_profile.zip_code } }
    assert_redirected_to accountant_profile_url(@accountant_profile)
  end

  test "should destroy accountant_profile" do
    assert_difference('AccountantProfile.count', -1) do
      delete accountant_profile_url(@accountant_profile)
    end

    assert_redirected_to accountant_profiles_url
  end
end
