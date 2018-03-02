require 'test_helper'

class LoanDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_doc = loan_docs(:one)
  end

  test "should get index" do
    get loan_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_doc_url
    assert_response :success
  end

  test "should create loan_doc" do
    assert_difference('LoanDoc.count') do
      post loan_docs_url, params: { loan_doc: { compulsory: @loan_doc.compulsory, name: @loan_doc.name } }
    end

    assert_redirected_to loan_doc_url(LoanDoc.last)
  end

  test "should show loan_doc" do
    get loan_doc_url(@loan_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_doc_url(@loan_doc)
    assert_response :success
  end

  test "should update loan_doc" do
    patch loan_doc_url(@loan_doc), params: { loan_doc: { compulsory: @loan_doc.compulsory, name: @loan_doc.name } }
    assert_redirected_to loan_doc_url(@loan_doc)
  end

  test "should destroy loan_doc" do
    assert_difference('LoanDoc.count', -1) do
      delete loan_doc_url(@loan_doc)
    end

    assert_redirected_to loan_docs_url
  end
end
