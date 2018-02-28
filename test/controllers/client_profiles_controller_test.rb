require 'test_helper'

class ClientProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_profile = client_profiles(:one)
  end

  test "should get index" do
    get client_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_client_profile_url
    assert_response :success
  end

  test "should create client_profile" do
    assert_difference('ClientProfile.count') do
      post client_profiles_url, params: { client_profile: { address: @client_profile.address, birth_date: @client_profile.birth_date, city: @client_profile.city, civil_status: @client_profile.civil_status, company: @client_profile.company, department: @client_profile.department, employee_category: @client_profile.employee_category, enabled: @client_profile.enabled, image: @client_profile.image, job_title: @client_profile.job_title, manager: @client_profile.manager, mobile: @client_profile.mobile, sex: @client_profile.sex, telephone: @client_profile.telephone, zip_code: @client_profile.zip_code } }
    end

    assert_redirected_to client_profile_url(ClientProfile.last)
  end

  test "should show client_profile" do
    get client_profile_url(@client_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_profile_url(@client_profile)
    assert_response :success
  end

  test "should update client_profile" do
    patch client_profile_url(@client_profile), params: { client_profile: { address: @client_profile.address, birth_date: @client_profile.birth_date, city: @client_profile.city, civil_status: @client_profile.civil_status, company: @client_profile.company, department: @client_profile.department, employee_category: @client_profile.employee_category, enabled: @client_profile.enabled, image: @client_profile.image, job_title: @client_profile.job_title, manager: @client_profile.manager, mobile: @client_profile.mobile, sex: @client_profile.sex, telephone: @client_profile.telephone, zip_code: @client_profile.zip_code } }
    assert_redirected_to client_profile_url(@client_profile)
  end

  test "should destroy client_profile" do
    assert_difference('ClientProfile.count', -1) do
      delete client_profile_url(@client_profile)
    end

    assert_redirected_to client_profiles_url
  end
end
