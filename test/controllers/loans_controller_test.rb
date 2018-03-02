require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { application_date: @loan.application_date, approved_date: @loan.approved_date, disbursement_date: @loan.disbursement_date, from: @loan.from, net_interest: @loan.net_interest, net_loan: @loan.net_loan, notes: @loan.notes, principal_amount: @loan.principal_amount, principal_amount: @loan.principal_amount, status: @loan.status, string_id: @loan.string_id, to: @loan.to } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { application_date: @loan.application_date, approved_date: @loan.approved_date, disbursement_date: @loan.disbursement_date, from: @loan.from, net_interest: @loan.net_interest, net_loan: @loan.net_loan, notes: @loan.notes, principal_amount: @loan.principal_amount, principal_amount: @loan.principal_amount, status: @loan.status, string_id: @loan.string_id, to: @loan.to } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
