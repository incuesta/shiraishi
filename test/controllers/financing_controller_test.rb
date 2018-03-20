require 'test_helper'

class FinancingControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get financing_home_url
    assert_response :success
  end

  test "should get articles" do
    get financing_articles_url
    assert_response :success
  end

  test "should get services" do
    get financing_services_url
    assert_response :success
  end

  test "should get organization" do
    get financing_organization_url
    assert_response :success
  end

  test "should get about" do
    get financing_about_url
    assert_response :success
  end

  test "should get contacts" do
    get financing_contacts_url
    assert_response :success
  end

  test "should get help" do
    get financing_help_url
    assert_response :success
  end

end
