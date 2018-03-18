require 'test_helper'

class DataStoresControllerTest < ActionDispatch::IntegrationTest
  test "should get backups" do
    get data_stores_backups_url
    assert_response :success
  end

end
