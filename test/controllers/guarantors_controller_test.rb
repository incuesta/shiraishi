require 'test_helper'

class GuarantorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guarantor = guarantors(:one)
  end

  test "should get index" do
    get guarantors_url
    assert_response :success
  end

  test "should get new" do
    get new_guarantor_url
    assert_response :success
  end

  test "should create guarantor" do
    assert_difference('Guarantor.count') do
      post guarantors_url, params: { guarantor: { address: @guarantor.address, birth_date: @guarantor.birth_date, city: @guarantor.city, civil_status: @guarantor.civil_status, company: @guarantor.company, first_name: @guarantor.first_name, image: @guarantor.image, job_title: @guarantor.job_title, last_name: @guarantor.last_name, middle_name: @guarantor.middle_name, mobile: @guarantor.mobile, sex: @guarantor.sex, zip_code: @guarantor.zip_code } }
    end

    assert_redirected_to guarantor_url(Guarantor.last)
  end

  test "should show guarantor" do
    get guarantor_url(@guarantor)
    assert_response :success
  end

  test "should get edit" do
    get edit_guarantor_url(@guarantor)
    assert_response :success
  end

  test "should update guarantor" do
    patch guarantor_url(@guarantor), params: { guarantor: { address: @guarantor.address, birth_date: @guarantor.birth_date, city: @guarantor.city, civil_status: @guarantor.civil_status, company: @guarantor.company, first_name: @guarantor.first_name, image: @guarantor.image, job_title: @guarantor.job_title, last_name: @guarantor.last_name, middle_name: @guarantor.middle_name, mobile: @guarantor.mobile, sex: @guarantor.sex, zip_code: @guarantor.zip_code } }
    assert_redirected_to guarantor_url(@guarantor)
  end

  test "should destroy guarantor" do
    assert_difference('Guarantor.count', -1) do
      delete guarantor_url(@guarantor)
    end

    assert_redirected_to guarantors_url
  end
end
