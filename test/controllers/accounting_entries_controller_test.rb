require 'test_helper'

class AccountingEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accounting_entry = accounting_entries(:one)
  end

  test "should get index" do
    get accounting_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_accounting_entry_url
    assert_response :success
  end

  test "should create accounting_entry" do
    assert_difference('AccountingEntry.count') do
      post accounting_entries_url, params: { accounting_entry: { description: @accounting_entry.description, entry_date: @accounting_entry.entry_date, interest_income_balance: @accounting_entry.interest_income_balance, principal_balance: @accounting_entry.principal_balance, title: @accounting_entry.title } }
    end

    assert_redirected_to accounting_entry_url(AccountingEntry.last)
  end

  test "should show accounting_entry" do
    get accounting_entry_url(@accounting_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_accounting_entry_url(@accounting_entry)
    assert_response :success
  end

  test "should update accounting_entry" do
    patch accounting_entry_url(@accounting_entry), params: { accounting_entry: { description: @accounting_entry.description, entry_date: @accounting_entry.entry_date, interest_income_balance: @accounting_entry.interest_income_balance, principal_balance: @accounting_entry.principal_balance, title: @accounting_entry.title } }
    assert_redirected_to accounting_entry_url(@accounting_entry)
  end

  test "should destroy accounting_entry" do
    assert_difference('AccountingEntry.count', -1) do
      delete accounting_entry_url(@accounting_entry)
    end

    assert_redirected_to accounting_entries_url
  end
end
