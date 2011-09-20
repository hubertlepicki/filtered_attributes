require 'test_helper'

class AdvancedFiltersControllerTest < ActionController::TestCase
  test "should allow specified parameters" do
    post :create, account: { email: "foo@example.com", admin: true }
    assert_equal passed_params[:email], "foo@example.com"

    put :update, id: 1, account: { email: "foo@example.com", admin: true }
    assert_equal passed_params[:admin], true
  end

  test "should filter out not specified parameters" do
    post :create, account: { email: "foo@example.com", admin: true }
    assert_nil passed_params[:admin]

    put :update, id: 1, account: { email: "foo@example.com", admin: true }
    assert_nil passed_params[:email]
  end

  test "should allow specifying attributes_hash" do
    post :foo, foo: { bar: { account: { email: "foo@example.com", admin: true }}}
    assert_nil passed_params[:admin]
    assert_equal passed_params[:email], "foo@example.com"
  end
end
