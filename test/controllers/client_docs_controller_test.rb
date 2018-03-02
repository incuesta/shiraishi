require 'test_helper'

class ClientDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_doc = client_docs(:one)
  end

  test "should get index" do
    get client_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_client_doc_url
    assert_response :success
  end

  test "should create client_doc" do
    assert_difference('ClientDoc.count') do
      post client_docs_url, params: { client_doc: { name: @client_doc.name, submitted: @client_doc.submitted } }
    end

    assert_redirected_to client_doc_url(ClientDoc.last)
  end

  test "should show client_doc" do
    get client_doc_url(@client_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_doc_url(@client_doc)
    assert_response :success
  end

  test "should update client_doc" do
    patch client_doc_url(@client_doc), params: { client_doc: { name: @client_doc.name, submitted: @client_doc.submitted } }
    assert_redirected_to client_doc_url(@client_doc)
  end

  test "should destroy client_doc" do
    assert_difference('ClientDoc.count', -1) do
      delete client_doc_url(@client_doc)
    end

    assert_redirected_to client_docs_url
  end
end
