require 'test_helper'

class ClientAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_asset = client_assets(:one)
  end

  test "should get index" do
    get client_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_client_asset_url
    assert_response :success
  end

  test "should create client_asset" do
    assert_difference('ClientAsset.count') do
      post client_assets_url, params: { client_asset: { description: @client_asset.description, image: @client_asset.image, name: @client_asset.name } }
    end

    assert_redirected_to client_asset_url(ClientAsset.last)
  end

  test "should show client_asset" do
    get client_asset_url(@client_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_asset_url(@client_asset)
    assert_response :success
  end

  test "should update client_asset" do
    patch client_asset_url(@client_asset), params: { client_asset: { description: @client_asset.description, image: @client_asset.image, name: @client_asset.name } }
    assert_redirected_to client_asset_url(@client_asset)
  end

  test "should destroy client_asset" do
    assert_difference('ClientAsset.count', -1) do
      delete client_asset_url(@client_asset)
    end

    assert_redirected_to client_assets_url
  end
end
