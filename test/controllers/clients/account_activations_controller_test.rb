require 'test_helper'

class Clients::AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_account_activations_index_url
    assert_response :success
  end

  test "should get show" do
    get clients_account_activations_show_url
    assert_response :success
  end

  test "should get edit" do
    get clients_account_activations_edit_url
    assert_response :success
  end

  test "should get update" do
    get clients_account_activations_update_url
    assert_response :success
  end

end
