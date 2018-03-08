require 'test_helper'

class LoanSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_search = loan_searches(:one)
  end

  test "should get index" do
    get loan_searches_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_search_url
    assert_response :success
  end

  test "should create loan_search" do
    assert_difference('LoanSearch.count') do
      post loan_searches_url, params: { loan_search: { application_date: @loan_search.application_date, approved_date: @loan_search.approved_date, client_first_name: @loan_search.client_first_name, client_last_name: @loan_search.client_last_name, client_middle_name: @loan_search.client_middle_name, disbursement_date: @loan_search.disbursement_date, fully_paid: @loan_search.fully_paid, loan_status: @loan_search.loan_status, loan_type_id: @loan_search.loan_type_id, string_id: @loan_search.string_id } }
    end

    assert_redirected_to loan_search_url(LoanSearch.last)
  end

  test "should show loan_search" do
    get loan_search_url(@loan_search)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_search_url(@loan_search)
    assert_response :success
  end

  test "should update loan_search" do
    patch loan_search_url(@loan_search), params: { loan_search: { application_date: @loan_search.application_date, approved_date: @loan_search.approved_date, client_first_name: @loan_search.client_first_name, client_last_name: @loan_search.client_last_name, client_middle_name: @loan_search.client_middle_name, disbursement_date: @loan_search.disbursement_date, fully_paid: @loan_search.fully_paid, loan_status: @loan_search.loan_status, loan_type_id: @loan_search.loan_type_id, string_id: @loan_search.string_id } }
    assert_redirected_to loan_search_url(@loan_search)
  end

  test "should destroy loan_search" do
    assert_difference('LoanSearch.count', -1) do
      delete loan_search_url(@loan_search)
    end

    assert_redirected_to loan_searches_url
  end
end
