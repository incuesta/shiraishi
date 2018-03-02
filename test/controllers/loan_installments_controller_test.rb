require 'test_helper'

class LoanInstallmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_installment = loan_installments(:one)
  end

  test "should get index" do
    get loan_installments_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_installment_url
    assert_response :success
  end

  test "should create loan_installment" do
    assert_difference('LoanInstallment.count') do
      post loan_installments_url, params: { loan_installment: { client: @loan_installment.client, decimal: @loan_installment.decimal, emi_installment: @loan_installment.emi_installment, from: @loan_installment.from, installment_no: @loan_installment.installment_no, interest_amount: @loan_installment.interest_amount, notes: @loan_installment.notes, principal_amount: @loan_installment.principal_amount, state: @loan_installment.state, to: @loan_installment.to } }
    end

    assert_redirected_to loan_installment_url(LoanInstallment.last)
  end

  test "should show loan_installment" do
    get loan_installment_url(@loan_installment)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_installment_url(@loan_installment)
    assert_response :success
  end

  test "should update loan_installment" do
    patch loan_installment_url(@loan_installment), params: { loan_installment: { client: @loan_installment.client, decimal: @loan_installment.decimal, emi_installment: @loan_installment.emi_installment, from: @loan_installment.from, installment_no: @loan_installment.installment_no, interest_amount: @loan_installment.interest_amount, notes: @loan_installment.notes, principal_amount: @loan_installment.principal_amount, state: @loan_installment.state, to: @loan_installment.to } }
    assert_redirected_to loan_installment_url(@loan_installment)
  end

  test "should destroy loan_installment" do
    assert_difference('LoanInstallment.count', -1) do
      delete loan_installment_url(@loan_installment)
    end

    assert_redirected_to loan_installments_url
  end
end
